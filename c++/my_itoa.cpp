#include<iostream>

void my_itoa(int value, char* str){
	int idx=0;
	int valReversed=0;
	
	while(value>=1){
		valReversed = valReversed*10 + value%10;
		value = value/10;	
	}
	
	while(valReversed>=0){
		str[idx++] = valReversed%10+48; //48 is ascii character '0'
		if(valReversed>=10){
			valReversed = valReversed/10;
		} else {
			break;
		}
	}
	
	str[idx] = '\0';
}

int main(){
	char str[6];
	
	my_itoa(12345, str);
	
	printf("%s\n", str);
	
	return 0;
} 