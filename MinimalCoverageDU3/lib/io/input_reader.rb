require 'lib/problem/line'

class InputReader
 
  attr_accessor :test_cases
  
  def initialize(f)
    @file = f
  end
  
  #Reads number of problems in file
  def read_test_cases
    Integer(@file.gets)
  end
  
  #Reads end of the coverage(0..M)
  def read_m
    Integer(@file.gets)
  end
  
  #Reads possible line segments
  def read_lines
    lines = Array.new
    line = @file.gets
    tokens = line.scan(/[-+]?\d*\.?\d+/)
    x1 = Integer(tokens[0])
    x2 = Integer(tokens[1])
      
    while not (x1==0 and x2==0)
      l = Line.new(x1,x2)
      lines.push(l)
      line = @file.gets
      tokens = line.scan(/[-+]?\d*\.?\d+/)
     
      x1 = Integer(tokens[0])
      x2 = Integer(tokens[1])
      
    end
    
    return lines
    
  end
end
