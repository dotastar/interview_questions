/*
You are on a cargo plane full of commercial goods when the pilot announces that the plane is short on fuel. Unless cargo is ejected from the plane, you will run out of fuel and crash. The pilot provides you with the number of pounds of weight that must be ejected from the plane. Fortunately, the manifest of the plane is both completely accurate, digitized, and you are a programmer of some repute. Unfortunately, your boss is going to be extremely unhappy, and wants you to exactly minimize the losses to the absolute minimum possible without crashing the plane. The manifest does not contain the exact quantities of every type of good, because you have so many on board. You may assume that you will not run out of any good in the course of saving the plane. You also realize this kind of program could be handy to others who find themselves in similar situations.

Write a program that takes a single argument on the command line. This argument must be a file name, which contains the input data. The program should output to standard out the minimum losses your boss will incur from your ejection of goods (see below). Your program will be tested against several manifests of several crashing planes; each with different data. Additionally, your program must be fast, and give the correct answer. 
*/

package usrbincrash;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tom
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            int[] minValue; //Array used for our dynamic programming solution
            List items = new ArrayList();
            
            int totalWeight;
            String line;
            FileReader input = new FileReader(args[0]);
            BufferedReader in = new BufferedReader(input);
            
            //Get the total weight that we need to eject.
            totalWeight = Integer.parseInt(in.readLine());
            //Now that we know the total weight, we need to allocate space for
            //our dynamic programming array
            minValue = new int[totalWeight];
            //For a totalWeight of 0, we know that the min value is 0.
            minValue[0] = 0;
            
            //Read in all the items.
            while((line = in.readLine()) != null) {
                items.add(new Item(line));
            }
            
            //EXPLAIN DYNAMIC PROGRAMMING ALGO
            for(int maxWeight=1; maxWeight < totalWeight; maxWeight++){
                //int indexOfCheapestItem=-1;
                int minValueLost=-1; //Should be infinity, but we will represent
                                     //as -1
                
                //We will evalute how each item affects the total value lost.
                for(int i=0; i < items.size(); i++){
                    int totalValueLost;
                    int currItemWeight = ((Item)items.get(i)).getWeight();
                    int currItemValue = ((Item)items.get(i)).getValue();
                    
                    //If the item we are currently looking at is the cheapest
                    //alternative thus far, we need to make a note of it.
                    if(currItemWeight <= maxWeight){
                        if(minValue[maxWeight-currItemWeight] != -1){
                            totalValueLost = currItemValue + minValue[maxWeight-currItemWeight];
                            if(minValueLost==-1 || totalValueLost < minValueLost){
                                minValueLost=totalValueLost;
                                //indexOfCheapestItem=i;
                            }
                        }
                    }
                }
                
                minValue[maxWeight] = minValueLost;
            }
            
            //For the maxWeight = totalWeight, there is the possibility that
            //we could eject more weight than the bare minimum.
            int minValueLost=-1;
            
            for(int i=0; i < items.size(); i++){
                int totalValueLost;
                int currItemWeight = ((Item)items.get(i)).getWeight();
                int currItemValue = ((Item)items.get(i)).getValue();

                //If the item we are currently looking at is the cheapest
                //alternative thus far, we need to make a note of it.
                for(int j=totalWeight-currItemWeight; j<totalWeight; j++){
                    if(j>0 && minValue[j] != -1){
                        totalValueLost = currItemValue + minValue[j];
                        if(minValueLost==-1 || totalValueLost < minValueLost){
                            minValueLost=totalValueLost;
                            //indexOfCheapestItem=i;
                        }
                    }
                }
            }
                
            System.out.println(minValueLost);
            
        } catch(Exception e) {
            System.err.println("Could not read file " + args[0] + ": " + e + ".");
        }
        
        
    }

}
