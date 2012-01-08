# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'lib/io/input_reader'
require 'lib/problem/coverage_problem'

class CoverageTest < Test::Unit::TestCase
  def test_reader
    f = File.open("test/test2.txt","r")
    reader = InputReader.new(f)
    test_cases=reader.read_test_cases
    assert_equal(2,test_cases)
    f.gets
    m=reader.read_m
    assert_equal(5,m)
    return reader
  end
  
  
  def test_lines
    reader=test_reader
    lines=reader.read_lines
    
    assert_equal(3,lines.size)
    line = lines[0]
    assert_equal(-1,line.x1)
    assert_equal(1,line.x2)
    line = lines[1]
    assert_equal(0,line.x1)
    assert_equal(2,line.x2)
    line = lines[2]
    assert_equal(2,line.x1)
    assert_equal(5,line.x2)
    return lines
  end
  
  def test_count
    lines = test_lines
    problem=CoverageProblem.new(5,lines)
    problem.solve
    assert_equal(2,problem.coverLines.size)
  end
  
end
