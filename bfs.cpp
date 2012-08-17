#include<iostream>

class Node {
	public:
		int element;
		Node* next;
		
		Node(int e){
			element = e;
			next = NULL;
		}
};

class LinkedList {
	protected:
		Node* head;
		int len;
	
	public:
		LinkedList(){
			head = NULL;
			len=0;
		}
		
		bool isEmpty(){
			return len==0;
		}
		
		int size(){
			return len;
		}
};

int main(){
	LinkedList alreadySeen