#include <stdio.h>
#include <string.h>
#include <math.h>

#define ARRAY_SIZE 11

void insertion_sort(int* nums, int length){
	int i, j, idx, temp;
	
	for(i=1; i<length; i++){
		//printf("%d ",nums[i]);
		for(j=i-1;j>=0;j--){
			if(nums[j+1]<nums[j]){
				temp = nums[j];
				nums[j] = nums[j+1];
				nums[j+1] = temp;
			} else {
				break;
			}
		}
	}
}

//Helper function for shell_sort
void gap_sort(int* nums, int length, int gap){
	int i,j,k, temp;
	
	for(i=0;i<gap;i++){
		for(j=i+gap;j<length;j=j+gap){
			for(k=j-gap;k>=0;k=k-gap){
				if(nums[k+gap]<nums[k]){
					temp = nums[k];
					nums[k]=nums[k+gap];
					nums[k+gap]=temp;
				} else {
					break;
				}
			}
		}
	}
}
   
void shell_sort(int* nums, int length){
	//5-gap sort
	gap_sort(nums, length, 5);
	
	//3-gap sort
	gap_sort(nums, length, 3);
	
	//1-gap sort, aka insertion sort
	gap_sort(nums, length, 1);
}

void merge(int* left, int lenLeft, int* right, int lenRight){
	int l_idx=0, r_idx=0, sorted_idx=0;
	int sorted[lenLeft+lenRight];
	
	while(l_idx < lenLeft || r_idx < lenRight){
		if(l_idx < lenLeft && 
			(left[l_idx]<right[r_idx] || r_idx >= lenRight)){
			sorted[sorted_idx++] = left[l_idx++];
		} else if(r_idx < lenRight) {
			sorted[sorted_idx++] = right[r_idx++];
		}
	}
	
	memcpy(left,sorted,(lenLeft+lenRight)*sizeof(int));
}

void merge_sort(int* nums, int length){
	if(length>1){
		merge_sort(nums, length/2);
		merge_sort(&nums[length/2], ceil(length/2.0));
		merge(nums, length/2, &nums[length/2], ceil(length/2.0));
	}
}

void quick_sort(int* nums, int length){
	int small_idx=0, large_idx=length-2, temp;
	
	if(length>1){
		//nums[length-1] is the pivot.
		while(small_idx<large_idx){
			if(nums[small_idx]<nums[length-1]){
				small_idx++;
			} else {
				temp = nums[large_idx];
				nums[large_idx--] = nums[small_idx];
				nums[small_idx] = temp;
			}
		}
		
		if(nums[small_idx]>nums[length-1]){
			temp = nums[small_idx];
			nums[small_idx] = nums[length-1];
			nums[length-1] = temp;
		} else {	
			temp = nums[large_idx+1];
			nums[large_idx+1] = nums[length-1];
			nums[length-1] = temp;
		}
		
		quick_sort(nums,small_idx+1);
		quick_sort(&nums[large_idx+1],length-large_idx-1);
	}
}

void printAndReset(int* origList, int* sortedList, int length){
	int i;
	
	for(i=0;i<length;i++){
		printf("%d ",sortedList[i]);
	}
	
	printf("\n");
	
	memcpy(sortedList,origList,length*sizeof(int));
}

int main(){
	int list[ARRAY_SIZE] = {6,8,1,3,5,10,0,2,9,4,7};
	int list2[ARRAY_SIZE];
	int i;
	
	memcpy(list2,list,ARRAY_SIZE*sizeof(int));
	
	insertion_sort(list2, ARRAY_SIZE);
	printAndReset(list,list2,ARRAY_SIZE);
	
	shell_sort(list2, ARRAY_SIZE);
	printAndReset(list,list2,ARRAY_SIZE);
	
	merge_sort(list2, ARRAY_SIZE);
	printAndReset(list,list2,ARRAY_SIZE);
	
	quick_sort(list2, ARRAY_SIZE);
	printAndReset(list,list2,ARRAY_SIZE);
	
	return 0;
}