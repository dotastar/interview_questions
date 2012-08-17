#include<stdio.h>

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
	private:
		Node* head;
	
	public:
		LinkedList(){
			head = NULL;
		}
		
		void add(Node* node){
			Node* temp = head;
			
			if(head==NULL){
				head = node;
			} else {
				while(temp->next != NULL){
					temp = temp->next;
				}
				
				temp->next = node;
			}
		}
		
		void remove(int elemToDelete){
			Node **itr;
			
			for(itr=&head;*itr!=NULL;itr=&(*itr)->next){
				if((*itr)->element == elemToDelete){
					//delete(*itr);
					*itr = (*itr)->next;
					break;
				}
			}
		}
		
		void reverse () {
			Node* temp = NULL;
			Node* head2 = NULL;
			
			if(head != NULL){
				while(head != NULL) {
					temp = head->next;
					head->next = head2;
					head2 = head;
					head = temp;
				}
				
				head = head2;
			}
		}
		
		void print() {
			Node* temp = head;
			
			printf("List: ");
			
			while(temp !=NULL){
				printf("%d ",temp->element);
				temp = temp->next;
			}
			
			printf("\n");
		}
};

int main(){
	Node* nodes[20];
	LinkedList list;
	
	for(int i=0;i<20;i++){
		nodes[i] = new Node(i);
		list.add(nodes[i]);
	}
	
	list.print();
	
	printf("Removing odd-numbered nodes\n");
	
	for(int i=1;i<20;i+=2){
		list.remove(i);
	}
	
	list.print();
	
	list.reverse();
	list.print();
	
	for(int i=0;i<20;i++){
		delete(nodes[i]);
	}
	
	return 0;
}