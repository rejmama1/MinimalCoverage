# To change this template, choose Tools | Templates
# and open the template in the editor.

class CoverageProblem
 
 
  attr_reader :m, :lines,:coverLines
  def initialize(m, lines)
    @m = m
    @lines = lines
    @coverLines = Array.new
    @bestSolutionSize=0;
    
    
  end
  
  #Solves problem
  def solve
    #Checks if line segment is not full under 0
    for i in 0..@lines.size-1 
      if @lines[i].negative?
        next
      end
      
      indexes = Array.new
      indexes.push(i)
      
      cover(indexes,@lines.size-1)
    end
    
    
  end
  
  #Tries to cover line
  def cover(indexes, counter)
    #Check if current deep is not bigger than best result
    if(@bestSolutionSize!=0 && counter<@lines.size-@bestSolutionSize)
       return
     end
   
    #Check if given indexes covers whole line
    if solution?(indexes)
      
      if (indexes.size < @coverLines.size) || ( @coverLines.size == 0)
        @coverLines.clear
        for i in 0..indexes.size-1
          @coverLines.push(indexes[i])
          
        end
        
        @bestSolutionSize=@coverLines.size
        
        return
      end
     
      
    end
    previous_fill = -1
     
    for j in 0..counter-1
      new_indexes = indexes.dup
      previous_fill = fill_next(new_indexes, previous_fill)
      if @lines[previous_fill].negative?
        next
      end    
     
      cover(new_indexes, counter-1)
     
      
    end
    
    
    
  end
  
  #Search for new index
  #If sorted indexes correspond with array indexes pushes next index, otherwise pushed first which does not correspond
  def fill_next(indexes, previous_fill)
    if previous_fill != -1
      p = previous_fill + 1 
      indexes.push(p)
      return p
   
    else
      sorted = indexes.dup
      sorted = sorted.sort!
      for i in 0..sorted.size-1
        if i != sorted[i]
          indexes.push(i)
          return i
        end
      end
      index = indexes.size
      indexes.push(index)
      return index;
    
      
    end
    
    
    
  end
  
  def solution?(indexes)
    
    cover = 0;
    start = false;
    lines=Array.new
    for i in 0..indexes.size-1
      line=indexes[i]
      lines.push(@lines[line])
      
    end
    
    lines = lines.sort! { |a,b| a.x1<=> b.x1 }
    for j in 0..lines.size-1
      if lines[j].x1<=0 && lines[j].x2>=0
        start=true;
      end
      if lines[j].x1<=cover && lines[j].x2>=cover
        cover=lines[j].x2
      end
    end
    
    if start && (cover>=@m)
      return true
    else
      return false
      
    end
    
  end
  
  def render_result
    puts @coverLines.size
    for i in 0..@coverLines.size-1
      puts @lines[@coverLines[i]].x1.to_s + " " + @lines[@coverLines[i]].x2.to_s
    end
    puts
  end
  
  
end
