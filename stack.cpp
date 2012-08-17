//Implement a stack in C using a linked list
#include <iostream>

using namespace std;

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

class Stack: public LinkedList {
	public:
		Stack(){};
		
		void push(int e){
			Node* n = new Node(e);
			n->next = head;
			head = n;
			len++;
		}
		
		int pop(){
			int retval = head->element;
			Node* temp = head->next;
			free(head);
			head = temp;
			len--;
			
			return retval;
		}
		
		int peek(){
			return head->element;
		}
};
			

int main() {
	Stack stack;
	
	cout << "Pushing ";
	
	for(int i=0;i<10;i++){
		cout << i << " ";
		stack.push(i);
	}
	
	cout << endl;
	
	cout << "Popping all " << stack.size() << " items...";
	while(!stack.isEmpty()){
		cout << stack.pop() << " ";
	}
	
	cout << endl;
	
	return 0;
}