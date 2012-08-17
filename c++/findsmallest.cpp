#include<stdio.h>
#include<stdlib.h>
#include<ctime>

#define ARRAY_SIZE 10

int findSmallest(int* list, int length){
	int lowIdx, highIdx, currIdx;
	
	lowIdx  = 0;
	highIdx = length-1;
	currIdx = length/2;
	
	while(1){
		printf("Comparing list[%d]=%d vs list[0]=%d\n",currIdx, list[currIdx],list[0]);
		if(list[currIdx] > list[0]){
			if(currIdx == highIdx-1){
				if(list[currIdx] < list[highIdx]){
					return currIdx;
				} else {
					return highIdx;
				}
			}
			lowIdx = currIdx;
			currIdx = (currIdx + highIdx)/2;
		} else if(list[currIdx] < list[0]){
			if(currIdx == lowIdx+1){
				if(list[currIdx] < list[lowIdx]){
					return currIdx;
				} else {
					return lowIdx;
				}
			}
			highIdx = currIdx;
			currIdx = (currIdx + lowIdx)/2;
		}
	}
}

int main(){
	int list[ARRAY_SIZE];
	int num;
	
	srand((unsigned)time(0));
	num = (rand() % ARRAY_SIZE) + 1;
	
	for(int i=0; i<10; i++){
		list[i] = num;
		num = (num+1)%ARRAY_SIZE;
		if(num==0)
			num=10;
		printf("%d ",list[i]);
	}
	
	printf("\n");
	
	printf("Index of smallest int=%d\n", findSmallest(list, ARRAY_SIZE));
}

// 10 1 2 3