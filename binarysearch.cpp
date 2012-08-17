#include<iostream>

using namespace std;

int binarySearch(int needle, int* haystack, int len){
	int retval;
	if(len<=1){
		if(haystack[0]==needle){
			printf("found it! %d\n", haystack[0]);
			return 0;
		} else {
			return -1;
		}
	} else {
		printf("Checking %d vs. %d\n",needle, haystack[len/2]);
		if(haystack[len/2]<needle){
			retval = binarySearch(needle, &haystack[len/2+1], len - len/2 -1);
			if(retval!=-1){
				return len/2 + 1 + retval;
			} else {
				return -1;
			}
		} else if(haystack[len/2]>needle){
			retval = binarySearch(needle, haystack, len/2);
			if(retval!=-1){
				return retval;
			} else {
				return -1;
			}
		} else { //haystack[len/2]==needle
			printf("found it! %d\n", haystack[len/2]);
			return len/2;
		}
	}
}

int main(){
	int len = 10;
	int nums[]={2,3,5,6,8,9,10,13,17,20};
	//int nums[]= {5};
	
	printf("Found at index %d\n", binarySearch(20,nums,len));
	
	return 0;
}
	
	