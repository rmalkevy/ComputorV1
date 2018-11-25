class EquationSolver
  attr_reader :polynomial_terms, :degree

  def initialize(polynomial_terms)
    @polynomial_terms = polynomial_terms
    @degree = polynomial_terms.map(&:degree).max
  end

  def solve_equation
    puts "Polynomial degree: \033[36m#{@degree}\033[39m"
    a, b, c = 0, 0, 0
    if @degree == 0
      a = @polynomial_terms[0].value.round(6)
      if a == 0
        puts "\033[36mEvery real are solution\033[39m"
      else
        puts "\033[36mNo solution\033[39m"
      end
    elsif @degree == 1
      if @polynomial_terms.length > 1
        a = @polynomial_terms[1].value.round(6)
        b = @polynomial_terms[0].value.round(6)
      else
        a = @polynomial_terms[0].value.round(6)
        b = 0
      end
      puts "Intermediate steps:"
      puts "\033[36ma = #{a}\033[39m"
      puts "\033[36mb = #{b}\033[39m"

      x = (-b / a)
      puts "\033[36mx = -b / a\033[39m"
      puts "\033[36mx = #{-b} / #{a}\033[39m"
      puts "\033[36mx = #{x}\033[39m"

      puts "The solution is:"
      puts "\033[36m-b / a = \033[32m#{x}\033[39m"
    elsif @degree == 2
      if @polynomial_terms.length == 3
        a = @polynomial_terms[2].value.round(6)
        b = @polynomial_terms[1].value.round(6)
        c = @polynomial_terms[0].value.round(6)
      elsif @polynomial_terms.length == 2
        a = @polynomial_terms[1].value.round(6)
        if @polynomial_terms[0].degree == 1
          b = @polynomial_terms[0].value.round(6)
          c = 0
        elsif @polynomial_terms[0].degree == 0
          b = 0
          c = @polynomial_terms[0].value.round(6)
        end
      elsif @polynomial_terms.length == 1
        a = @polynomial_terms[0].value.round(6)
        b = 0
        c = 0
      end

      puts "Intermediate steps:"
      puts "\033[36ma = #{a}\033[39m"
      puts "\033[36mb = #{b}\033[39m"
      puts "\033[36mc = #{c}\033[39m"

      d = b**2 - (4 * a * c)
      puts "\033[36md = b**2 - (4 * a * c)\033[39m"
      puts "\033[36md = #{b}**2 - (4 * #{a} * #{c})\033[39m"
      puts "\033[36md = #{d}\033[39m"

      if d > 0
        x1 = ((-b + (d**0.5)) / (2 * a)).round(6).to_s
        x2 = ((-b - (d**0.5)) / (2 * a)).round(6).to_s

        puts "\033[36mx1 = (-b + (d ** 0.5)) / (2 * a)\033[39m"
        puts "\033[36mx1 = (#{-b} + (#{d} ** 0.5)) / (2 * #{a})\033[39m"
        puts "\033[36mx1 = (#{-b} + (#{(d**0.5).round(6)})) / (#{2 * a})\033[39m"
        puts "\033[36mx1 = \033[32m#{x1}\033[39m"

        puts "\033[36mx2 = (-b - (d ** 0.5)) / (2 * a)\033[39m"
        puts "\033[36mx2 = (#{-b} - (#{d} ** 0.5)) / (2 * #{a})\033[39m"
        puts "\033[36mx2 = (#{-b} - (#{(d**0.5).round(6)})) / (#{2 * a})\033[39m"
        puts "\033[36mx2 = \033[32m#{x2}\033[39m"


        puts "Discriminant is strictly positive, the two solutions are:"
        puts "\033[32m#{x1}\033[39m"
        puts "\033[32m#{x2}\033[39m"

      elsif d == 0
        x = (-b / (2 * a)).round(6)
        puts "\033[36mx = -b / (2 * a)\033[39m"
        puts "\033[36mx = #{-b} / (2 * #{a})\033[39m"
        puts "\033[36mx = #{x}\033[39m"
        puts "Discriminant is 0, the solution is:"
        puts "\033[32m#{x}\033[39m"
      else
        x1i = "\033[36mx1i = (#{-b} + (#{(d.abs**0.5).round(6)}) * i) / (#{2 * a})\033[39m"
        x2i = "\033[36mx2i = (#{-b} - (#{(d.abs**0.5).round(6)}) * i) / (#{2 * a})\033[39m"

        puts "\033[36mx1i = (-b + (d ** 0.5) * i) / (2 * a)\033[39m"
        puts "\033[36mx1i = (#{-b} + (#{d} ** 0.5) * i) / (2 * #{a})\033[39m"
        puts x1i

        puts "\033[36mx2i = (-b - (d ** 0.5) * i) / (2 * a)\033[39m"
        puts "\033[36mx2i = (#{-b} - (#{d}) ** 0.5) * i) / (2 * #{a})\033[39m"
        puts x2i

        puts "Discriminant is strictly negative, the two Complex number solutions are:"
        puts x1i
        puts x2i
      end
    elsif @degree > 2
      puts "The polynomial degree is strictly greater than 2, I can't solve this equation."
    end
  end

end