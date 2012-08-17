#ifndef TEMPLATE_H
#define TEMPLATE_H

template< class T>
class Stack {
	public:
		Stack(int i);
		
		~Stack(){
			delete [] stackPtr;
		}
		
		bool push(const T& val);
		bool pop(T &val);
		
		bool isFull();
		bool isEmpty();
	private:
		T *stackPtr;
		int top;
		int size;
};

template<class T>
Stack<T>::Stack(int i=10){
	size = i>0? i : 10;
	top = -1;
	stackPtr = new T[size];
}

template<class T>
bool Stack<T>::push(const T& val){
	if(!isFull()){
		stackPtr[++top] = val;
		return true;
	} else {
		return false;
	}
}

template<class T>
bool Stack<T>::pop(T &val){
	if(!isEmpty()){
		val = stackPtr[top--];
		return true;
	} else {
		return false;
	}
}

template<class T>
bool Stack<T>::isFull(){
	return top == size-1;
}

template<class T>
bool Stack<T>::isEmpty(){
	return top < 0;
}

#endif