#include<iostream>
#include<fstream>
using namespace std;

int main(){
	ofstream outClientFile("client.txt", ios::app);
	
	if(!outClientFile) {
			cerr << "File could not be opened!" << endl;
			exit(1);
	}
	
	cout << "Enter the account, name, and balance." << endl;
	cout << "Enter end-of-file to end input" << endl << "?";
	
	int account;
	char name[30];
	double balance;
	
	while(cin >> account >> name >> balance){
		outClientFile << account << " " << name << " " << balance << endl;
		cout << "? ";
	}
	
	cout << "Recorded!" < endl;
	
	return 0;
}