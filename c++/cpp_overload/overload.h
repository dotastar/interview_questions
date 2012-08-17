#ifndef OVERLOAD_H
#define OVERLOAD_H

class Array {
	public:
		Array( int );
		Array( const Array& );
		~Array();
		
		const Array& operator=(const Array&);
		const bool operator==(const Array&);
		const bool operator!=(const Array&);
		
		int& operator[](int);
	private:
		int size;
		int *ptr;
};

#endif