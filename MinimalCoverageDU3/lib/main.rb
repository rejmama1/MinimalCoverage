require "lib/io/input_reader"
require "lib/problem/coverage_problem"

problems = Array.new


f = File.open( "lib/sample1.txt" , "r" )
reader = InputReader.new(f)
test_cases = reader.read_test_cases

for k in 0..test_cases-1
  f.gets
  m = reader.read_m
 
  lines = reader.read_lines
  problems.push(CoverageProblem.new(m, lines))

end

for i in 0..problems.size-1
  problems[i].solve
  problems[i].render_result
end


