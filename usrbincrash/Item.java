package usrbincrash;

/**
 *
 * @author Tom
 */
public class Item {
    private int weight;
    private int value;
    
    public Item(String line){
        String[] itemInfo = new String[3];
        itemInfo = line.split("[ \t]+"); //Split by whitespaces
        //Since we do not need the item SKU, I will simply ignore it in the
        //interest of space.
        weight = Integer.parseInt(itemInfo[1]);
        value = Integer.parseInt(itemInfo[2]);
    }
    
    public int getWeight(){
        return weight;
    }
    
    public int getValue(){
        return value;
    }
}
