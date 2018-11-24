require_relative 'parse_and_validate_polynomial'
require_relative 'polynomial'
require_relative 'solver'

parser = ArgsParser.new(ARGV)
solver = EquationSolver.new(parser.reduced_equation)

solver.solve_equation
