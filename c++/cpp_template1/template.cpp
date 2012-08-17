#include <iostream>
#include "template.h"

using std::cout;
using std::cin;
using std::endl;

int main(){
	Stack<int> intStack(10);
	Stack<double> doubleStack;
	
	int i = 1;
	cout << "Pushing on to intStack..." << endl;
	while(!intStack.isFull()){
		cout << i << " ";
		intStack.push(i++);
	}
	cout << endl << "Done pushing!" << endl;
	
	cout << "Popping from the intStack..." << endl;
	while(!intStack.isEmpty()){
		int popVal;
		intStack.pop(popVal);
		cout << popVal << " ";
	}
	cout << endl << "Done popping!" << endl;
	
	double d = 1.1;
	cout << "Pushing on to doubleStack..." << endl;
	while(!doubleStack.isFull()){
		cout << d << " ";
		doubleStack.push(d++);
	}
	cout << endl << "Done pushing!" << endl;
	
	cout << "Popping from the doubleStack..." << endl;
	while(!doubleStack.isEmpty()){
		double popVal;
		doubleStack.pop(popVal);
		cout << popVal << " ";
	}
	cout << endl << "Done popping!" << endl;
	
	return 0;
}