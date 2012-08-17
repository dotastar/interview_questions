class Node {
	public:
		int element;
		Node* left;
		Node* right;
};

class BinarySearchTree {
	private:
		Node* root;
		int size;
	public:
		BinarySearchTree() {
			root = NULL;
			size = 0;
		}
		
		void insert(Node* node){
			Node* itr = root;
			while(1){
				if(itr->element < node->element){
					if(itr->left==NULL){
						itr->left= node;
						break;
					} else {
						itr = itr->left;
					}
				} else if(itr->eement > node->element) {
					if(itr->right==NULL){
						itr->right= node;
						break;
					} else {
						itr = itr->right;
					}
				} else { //equal. ignore.
					cout << "Already have node with element " << node->element << endl;
					free(node);
					break;
				}
			}
		}
		
		Node* search(int val){
			Node* itr = root;
			while(itr!=NULL){
				if(itr->element < val){
					itr = itr->left;
				} else if(itr->element > val) {
					itr = itr->right;
				} else { //equal
					return itr;
				}
			}
			
			return NULL; //ie cannot find value
		}
		
		Node* remove