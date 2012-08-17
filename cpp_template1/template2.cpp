#include <iostream>
#include "template.h"

using std::cout;
using std::cin;
using std::endl;

template<class T>
void testStack( Stack<T> &stack, T initVal, T incrVal, const char *name){
	T val;
	
	cout << "Pushing on to stack " << name << "..." << endl;
	while(stack.push(initVal)){
		cout << initVal << " ";
		initVal += incrVal;
	}
	cout << endl << "Done pushing!" << endl;
	
	cout << "Popping off the stack " << name << "..." <<endl;
	while(stack.pop(val)){
		cout << val << " ";
	}
	cout << endl <<"Done popping!" << endl;
}

int main(){
	Stack<int> intStack(10);
	Stack<double> doubleStack;
	
	testStack(intStack, 1, 2, "intStack");
	testStack(doubleStack, 1.1, 2.2, "doubleStack");
	
	return 0;
}