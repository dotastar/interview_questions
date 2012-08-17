#include<iostream>
#include<string>

using namespace std;

//Given a string, returns all permutations
string* permute(string str, int &len){
	if(str.size()>1){
		int numStrs;
		string* smallerStrs = permute(str.substr(1), numStrs);
		string* retval = new string[str.size()*numStrs];
		for(int i=0;i<numStrs;i++){
			for(int j=0;j<str.size();j++){
				if(j==0){
					retval[i*str.size()+j] = str.substr(0,1) + smallerStrs[i];
				} else if(j==str.size()-1){
					retval[i*str.size()+j] = smallerStrs[i] + str.substr(0,1);
				} else {
					retval[i*str.size()+j] = smallerStrs[i].substr(0,j) + str.substr(0,1) + smallerStrs[i].substr(j);
				}
			}
		}
		free(smallerStrs);
		len = str.size()*numStrs;
		return retval;
	} else {
		len = 1;
		string* retval = new string[1];
		retval[0] = str;
		return retval;
	}
}

int main(){
	string input("abcd");
	int len;
	string* permutations = permute(input,len);
	
	for(int i=0;i<len;i++){
		cout << i << ": " << permutations[i] << endl;
	}
	
	//delete permutations;
	
	return 0;
}