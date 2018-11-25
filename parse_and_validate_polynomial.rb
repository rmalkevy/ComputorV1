require_relative 'polynomial'

class ArgsParser
  attr_reader :raw_arg, :polynomial_terms_list, :reduced_equation

  def initialize(args)
    if args.length == 1 && args[0] != ''
      @raw_arg = args[0].gsub(/\s+/, "")  # delete all whitespaces in equation
      @polynomial_terms_list = []
      @reduced_equation = []

      unless valid_equation?(@raw_arg)
        exit_with_message "Error: Invalid string.\n" \
                          "The example of a valid equation: -578 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0"
      end

      split_to_polynomial_terms
      reduce_equation
      puts "Reduced form: \033[36m#{reduced_equation_str}\033[39m"
      reduced_equation_str
    else
      exit_with_message('Please add only one polynomial')
    end
  end


  private

  # Validate equation
  #
  def valid_equation?(str)
    !str.match(/[^-.^*+xX=0-9]/)
  end


  # Split to polynomial terms methods
  #
  def split_to_polynomial_terms
    left_and_right_sides = @raw_arg.split(/=/)
    unless left_and_right_sides.length == 2
      exit_with_message "Error: Invalid string.\n" \
                        "The example of a valid equation: -578 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0"
    end
    left_side = left_and_right_sides[0].split(/(?=[-+])/)
    right_side = left_and_right_sides[1].split(/(?=[-+])/)

    left_side.each do |term|
      number = extract_number(term)
      degree = extract_degree(term)
      @polynomial_terms_list << PolynomialTerm.new(number, degree)
    end

    right_side.each do |term|
      number = extract_number(term) * (-1)
      degree = extract_degree(term)
      @polynomial_terms_list << PolynomialTerm.new(number, degree)
    end
  end

  def extract_number(term)
    number = term.split(/\*|x|X/).first
    if number.nil? || number == ''
      number = '1'
    end
    number[/[.]/].nil? ? number.to_i : number.to_f
  end

  def extract_degree(term)
    degree = 0
    unless term[/[xX]/].nil?
      degree = numeric?(term[-1]) ? term[-1].to_i : 1
    end
    degree
  end

  def numeric?(lookAhead)
    lookAhead =~ /[[:digit:]]/
  end


  # Reduce equation
  #
  def reduce_equation
    degrees = @polynomial_terms_list.map(&:degree).sort.uniq
    degrees.each do |degree|
      degree_value = @polynomial_terms_list.select{|term| term.degree == degree}.map(&:value).inject(0, :+)
      unless degree_value.nil? or degree_value == 0
        @reduced_equation << PolynomialTerm.new(degree_value, degree)
      end
    end
    if @reduced_equation.length == 0
      puts "All the real numbers are solution"
      puts "Equation is reduced at all! Try to add equations with unknown variables"
      exit
    end
  end

  def reduced_equation_str
    reduced_equation_str = ''
    @reduced_equation.each do |term|
      number = prepare_number(term.value)
      reduced_equation_str += number + ' * X^' + term.degree.to_s + ' '
    end
    reduced_equation_str += '= 0'
    cut_first_two_chars(reduced_equation_str)
  end

  def prepare_number(number)
    sign = ''
    result = sign
    if number >= 0
      sign = '+ '
    else
      sign = '- '
      number *= -1
    end
    result += sign

    if number.to_s[/[.]/]
      result += number.round(6).to_s
    else
      result += number.to_s
    end
    result
  end

  def cut_first_two_chars(equation)
    ready_reduced_equation = ''
    if @reduced_equation[0].value >= 0
      ready_reduced_equation = equation[2..-1]
    else
      ready_reduced_equation = '-' + equation[2..-1]
    end
    ready_reduced_equation
  end

  # Exit with error message
  #
  def exit_with_message(message)
    puts(message)
    exit
  end

end
