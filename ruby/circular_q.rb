class Q
  attr_accessor :q
  
  def initialize(max)
    @max = max
    
    @head = 0
    @tail = 0
    @count = 0
    @q = []
  end
  
  def append(val)
    if (@count >= @max)
      @q = (0..@max-1).map { |n| @q[(@tail + n) % @max] }
      
      @max *= 2
      @head = 0
      @tail = @q.length
    end
    
    @q[@tail] = val
    @tail = (@tail + 1) % @max
    @count += 1
  end
  
  def pop()
    val = nil
    
    if (@count > 0)
      val = @q[@head]
      @head = (@head + 1) % @max
      @count -= 1
    end
    
    return val
  end
  
  def out()
    return (0..@count-1).map { |n| @q[(@head + n) % @max] }
  end
end

q = Q.new(10)
(1..10).each { |n| q.append(n) }
print q.out
puts
puts 'pop: ' + q.pop.to_s
print q.out
puts
q.append(11)
print q.out
puts
print q.q
puts

