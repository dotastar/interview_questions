#include<iostream>

class Node{
	public:
		int id;
		int* neighbors;
		int numNeighbors;
		
		Node(int name, int* edges, int num){
			id = name;
			neighbors = edges;
			numNieghbors = num;
		}
};

int main(){
	