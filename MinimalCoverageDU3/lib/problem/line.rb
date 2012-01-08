#Represents line
class Line
  
  attr_reader :x1,:x2
  #Initialize line a give lower x on left side
  def initialize(x1,x2)
    if(x2<x1)
      @x1=x2
      @x2=x1
    else
      @x1=x1
      @x2=x2
      
    end
  end
  
  def to_s
    @x1.to_s + " " + @x2.to_s
  end
  
  #Checks if line is whole under 0(Ex:<-1,0>,<-5,-2>)
  def negative?
    
    if @x1<=0 && @x2<=0
       true
    else
      false
    end
  end
  
  
end
