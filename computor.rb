require_relative 'parse_and_validate_polynomial'
require_relative 'polynomial'
require_relative 'solver'

parser = ArgsParser.new(ARGV)
solver = EquationSolver.new(parser.reduced_equation)

solver.solve_equation
# puts parser.raw_arg

# pol_1 = PolynomialTerm.new(-23, 2)
# pol_2 = PolynomialTerm.new(2, 2)
#
# puts pol_1 + pol_2


# puts "hf  sldls   lsls ls lsl ls lsl lsl fjlsjd lsjdf ksldf j ".delete(' ')

# def valid?(str)
#   (str =~ /[^-.^*+=xX0-9]/).nil?
# end

# puts "-578 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0".delete(' ').split(/(\d+)/)
# left_and_right_sides = "578 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0".delete(' ').split(/=/)
# left_side = left_and_right_sides[0].split(/(?=[-+])/)
# right_side = left_and_right_sides[1].split(/(?=[-+])/)
#
# puts left_side
# puts right_side
# # puts "578 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0".delete(' ').split(/(?=[-+])/)
# puts "Left side of equation"
# left_side.each do |term|
#   puts term[/[-+]?[0-9]*\.?[0-9]+/]
#   # puts term[]
# end

# float_num = "sdf-450234sdf"
# puts float_num[/[-+]?[0-9]*\.?[0-9]+/]

# number = "45.45"[/[-+]?[0-9]*\.?[0-9]+/]
# number = number[/[.]/].nil? ? number.to_i : number.to_f
# puts number
#

# degree = 0
# term = "34 * X ^ 3"
# unless term[/[xX][^^0-9]/].nil?
#   degree = term[/(?=[X])/]
#   puts degree
# end