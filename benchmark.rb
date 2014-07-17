require 'benchmark'
require 'integration'

f1 = lambda{|x| x}
puts "f(x) = x"
Benchmark.bm do |x|
  x.report("Rectangle: 			")		{Integration.integrate(0,1,{:method=>:rectangle},&f1)}
  x.report("Trapezoid: 			")		{Integration.integrate(0,1,{:method=>:trapezoid},&f1)}
  x.report("Simpson: 			")			{Integration.integrate(0,1,{:method=>:simpson},&f1)}
  x.report("Simpson 3/8: 		")		{Integration.integrate(0,1,{:method=>:simpson3by8},&f1)}
  x.report("Boole: 				")			{Integration.integrate(0,1,{:method=>:boole},&f1)}
  x.report("Open Trapezoid: 	")  	{Integration.integrate(0,1,{:method=>:open_trapezoid},&f1)}
  x.report("Milne: 				")  			{Integration.integrate(0,1,{:method=>:milne},&f1)}
  x.report("Adaptive Quadrature:")  {Integration.integrate(0,1,{:method=>:adaptive_quadrature},&f1)}
  x.report("Gauss: 				")			{Integration.integrate(0,1,{:method=>:gauss},&f1)}
  x.report("Gauss Kronrod: 		")	{Integration.integrate(0,1,{:method=>:gauss_kronrod},&f1)}
  x.report("Romberg: 			")			{Integration.integrate(0,1,{:method=>:romberg},&f1)}
  #x.report("Monte Carlo:")		{Integration.integrate(0,1,{:method=>:monte_carlo},&f1)}
end
