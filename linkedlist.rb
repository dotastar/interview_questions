class Node
  attr_accessor :nxt, :val
  
  def initialize (nxt, val)
    @nxt, @val = nxt, val
  end
end

class LinkedList
  def initialize(num)
    prev = nil
    for i in num.downto(1) do
      prev = Node.new(prev, i)
    end
    
    @head = prev
    out
  end
  
  def reverse!()
    head2 = nil
    
    while @head do
      temp = @head.nxt
      @head.nxt = head2 
      head2 = @head
      @head = temp
    end
    @head = head2
    out
  end
  
  def out()
    current = @head
    
    while current
      puts current.val
      current = current.nxt
    end
  end
end

ll = LinkedList.new(10)
puts "reversing"
ll.reverse!