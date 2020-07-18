/*********************************************************************************
Implementing Breadth first search on CUDA using algorithm given in HiPC'07
  paper "Accelerating Large Graph Algorithms on the GPU using CUDA"

Copyright (c) 2008 International Institute of Information Technology - Hyderabad. 
All rights reserved.
  
Permission to use, copy, modify and distribute this software and its documentation for 
educational purpose is hereby granted without fee, provided that the above copyright 
notice and this permission notice appear in all copies of this software and that you do 
not sell the software.
  
THE SOFTWARE IS PROVIDED "AS IS" AND WITHOUT WARRANTY OF ANY KIND,EXPRESS, IMPLIED OR 
OTHERWISE.

The CUDA Kernel for Applying BFS on a loaded Graph. Created By Pawan Harish
**********************************************************************************/
#ifndef _KERNEL_H_
#define _KERNEL_H_

__global__ void
Kernel( Node* g_graph_nodes, int* g_graph_edges, bool* g_graph_mask, bool* g_updating_graph_mask, bool *g_graph_visited, int* g_cost, int no_of_nodes) 
{
	int tid = blockIdx.x*MAX_THREADS_PER_BLOCK + threadIdx.x;
  if( tid<no_of_nodes && g_graph_mask[tid])
  {
    g_graph_mask[tid]=false;
    int nedges = g_graph_nodes[tid].no_of_edges;
    int left = nedges - nedges / 4 * 4;
    int cost = g_cost[tid];
    for (int i=g_graph_nodes[tid].starting; i<(left + g_graph_nodes[tid].starting); i+=1)
    {   
      int id1 = g_graph_edges[i];
      if(!g_graph_visited[id1])
      {   
        g_cost[id1]=cost + 1;
        g_updating_graph_mask[id1]=true;
      }   
    }   
    for (int i=g_graph_nodes[tid].starting + left; i<(nedges + g_graph_nodes[tid].starting); i+=4)
    {   
      int id1 = g_graph_edges[i];
      int id2 = g_graph_edges[i + 1]; 
      int id3 = g_graph_edges[i + 2]; 
      int id4 = g_graph_edges[i + 3]; 
      if(!g_graph_visited[id1])
      {   
        g_cost[id1]= cost + 1;
        g_updating_graph_mask[id1]=true;
      }   
      if (!g_graph_visited[id2]) {
        g_cost[id2]= cost + 1;
        g_updating_graph_mask[id2]=true;
      }   
      if (!g_graph_visited[id3]) {
        g_cost[id3]= cost + 1;
        g_updating_graph_mask[id3]=true;
      }   
      if (!g_graph_visited[id4]) {
        g_cost[id4]= cost + 1;
        g_updating_graph_mask[id4]=true;
      }   
    }   
  }
}

#endif 
