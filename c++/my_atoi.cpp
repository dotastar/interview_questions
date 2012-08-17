#include<stdio.h>

int my_atoi(char* str){
	char* itr;
	int num = 0;
	bool isNegative=false;
	
	for(itr=str;*itr!='\0';itr+=1){
		if(*itr=='-'){
			isNegative=true;
		} else {
			num *= 10;
			num += *itr - '0';
		}
	}
	
	if(isNegative){
		num *=-1;
	}
	
	return num;
}

int main(){
	char str[] = "-120345";
	char str2[] = "74563453";
	char str3[] = "0";
	
	printf("%d %d %d\n",my_atoi(str), my_atoi(str2), my_atoi(str3));

    return 0;
}
				