//========================================================================================================================================================================================================200
//	findRangeK function
//========================================================================================================================================================================================================200

__global__ void 
findRangeK(	long height,

			knode *knodesD,
			long knodes_elem,

			long *currKnodeD,
			long *offsetD,
			long *lastKnodeD,
			long *offset_2D,
			int *startD,
			int *endD,
			int *RecstartD, 
			int *ReclenD)
{

	// private thread IDs
	int thid = threadIdx.x;
	int bid = blockIdx.x;
  int start = startD[bid];
  int end = endD[bid];
  int *curr_keys = knodesD[currKnodeD[bid]].keys;
  int *last_keys = knodesD[lastKnodeD[bid]].keys;
  int *curr_indices = knodesD[currKnodeD[bid]].indices;
  int *last_indices = knodesD[lastKnodeD[bid]].indices;

	// ???
	int i;
	for(i = 0; i < height; i++){
		if((curr_keys[thid] <= start) && (curr_keys[thid+1] > start)){
			// this conditional statement is inserted to avoid crush due to but in original code
			// "offset[bid]" calculated below that later addresses part of knodes goes outside of its bounds cause segmentation fault
			// more specifically, values saved into knodes->indices in the main function are out of bounds of knodes that they address
			if(curr_indices[thid] < knodes_elem){
				offsetD[bid] = curr_indices[thid];
			}
		}
		if((last_keys[thid] <= end) && (last_keys[thid+1] > end)){
			// this conditional statement is inserted to avoid crush due to but in original code
			// "offset_2[bid]" calculated below that later addresses part of knodes goes outside of its bounds cause segmentation fault
			// more specifically, values saved into knodes->indices in the main function are out of bounds of knodes that they address
			if(last_indices[thid] < knodes_elem){
				offset_2D[bid] = last_indices[thid];
			}
		}
		__syncthreads();

		// set for next tree level
    curr_keys = knodesD[offsetD[bid]].keys;
    curr_indices = knodesD[offsetD[bid]].indices;
    last_keys = knodesD[offset_2D[bid]].keys;
    last_indices = knodesD[offset_2D[bid]].indices;

		__syncthreads();
	}

  int kend = last_keys[thid];
	// Find the index of the starting record
	if(curr_keys[thid] == start){
		RecstartD[bid] = curr_indices[thid];
	}
	__syncthreads();

	// Find the index of the ending record
	if(kend == end){
		ReclenD[bid] = last_indices[thid] - RecstartD[bid]+1;
	}

}

//========================================================================================================================================================================================================200
//	End
//========================================================================================================================================================================================================200
