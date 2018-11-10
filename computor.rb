require_relative 'parse_and_validate_polynomial'
require_relative 'polynomial'

parser = ArgsParser.new(ARGV)

puts parser.raw_arg

# pol_1 = PolynomialTerm.new(-23, 2)
# pol_2 = PolynomialTerm.new(2, 2)
#
# puts pol_1 + pol_2


# puts "hf  sldls   lsls ls lsl ls lsl lsl fjlsjd lsjdf ksldf j ".delete(' ')

# def valid?(str)
#   (str =~ /[^-.^*+=xX0-9]/).nil?
# end

# puts valid? "-578 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0".delete(' ')