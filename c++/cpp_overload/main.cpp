#include <iostream>
#include "overload.h"

using std::cout;
using std::cin;
using std::endl;

int main(){
	Array arr1(10);
	Array arr2(10);
	Array arr3(5);
	
	for(int i=0;i<5;i++){
		arr3[i] = i+5;
	}
	
	for(int i=0;i<10;i++){
		arr1[i] = i;
		arr2[i] = 2*i;
	}
	
	cout << "Comparing arr1 to arr2...";
	if(arr1==arr2){
		cout << "the same!";
	} else {
		cout << "not the same!";
	}
	cout << endl;
	
	cout << "Setting arr1=arr2..." << endl;
	arr1=arr2;
	for(int i=0; i<10;i++){
		cout << arr1[i] <<" ";
	}
	cout << endl;
	
	cout << "Setting arr3=arr1..." << endl;
	arr3=arr1;
	for(int i=0;i<10;i++){
		cout << arr3[i] << " ";
	}
	cout << endl;
	
	cout << "arr3==arr2? ";
	if(arr3==arr2) {
		cout << "Yes!";
	} else {
		cout << "Nope!";
	}
	cout << endl;
	
	return 0;
}