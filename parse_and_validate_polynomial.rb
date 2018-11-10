require_relative 'polynomial'

class ArgsParser
  attr_reader :raw_arg

  def initialize(args)
    if args.length == 1
      @raw_arg = args[0].gsub(/\s+/, "")  # delete all whitespaces in equation

      unless valid_equation?(@raw_arg)
        exit_with_message "Unsupported chars in the string. \n
                           The example of a valid equation: -578 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0"
      end
    else
      exit_with_message('Please add only one polynomial')
    end
  end

  # Todo: validation function for args

  def terms_list
    terms = []
    minus = 1
    number_s = ''


    @raw_arg.each do |char|

      if char == '-'
        minus *= -1
      end

      if numeric?(char)

      end

    end
  end

  private
  def numeric?(lookAhead)
    lookAhead =~ /[[:digit:]]/
  end

  def valid_equation?(str)
    (str =~ /[^-.^*+=xX0-9]/).nil?
  end

  def exit_with_message(message)
    puts(message)
    exit
  end

end


# Tasks
# >./computor "-578 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0"
# Reduced form: 4 * X^0 + 4 * X^1 - 9.3 * X^2 = 0
# Polynomial degree: 2
# Discriminant is strictly positive, the two solutions are:
# 0.905239