#include<iostream>
#include "overload.h"

using std::cout;
using std::cin;
using std::endl;

Array::Array(int i = 10){
	size=i>0?i:10;
	ptr = new int[size];
}

Array::Array(const Array& arr){
	ptr = new int[arr.size];
	
	for(int i=0;i<size;i++){
		ptr[i] = arr.ptr[i];
	}
}

Array::~Array(){
	delete [] ptr;
}

const Array& Array::operator=(const Array& arr){
	if(size != arr.size){
		delete [] ptr;
		size = arr.size;
		ptr = new int[size];
	}
	
	for(int i=0;i<size;i++){
		ptr[i] = arr.ptr[i];
	}
	
	return *this;
}

const bool Array::operator==(const Array& arr){
	if(size != arr.size){
		return false;
	} else {
		for(int i=0;i<size;i++){
			if(ptr[i]!=arr.ptr[i]){
				return false;
			}
		}
		return true;
	}
}

const bool Array::operator!=(const Array& arr){
	return !(*this==arr);
}
		
int& Array::operator[](int i){
	if(i<0 || i>size){
		cout << "ERROR: index is outside of range";
		exit(1);
	} else {
		return ptr[i];
	}
}