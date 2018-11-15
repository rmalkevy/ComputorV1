class EquationSolver
  attr_reader :polynomial_terms, :degree

  def initialize(polynomial_terms)
    @polynomial_terms = polynomial_terms
    @degree = polynomial_terms.map(&:degree).max
  end

  def solve_equation
    puts "Polynomial degree: \033[32m#{@degree}\033[39m"
    a, b, c = 0, 0, 0
    if @degree == 0
      a = @polynomial_terms[0].value
      if a == 0
        puts "\033[32mEvery real are solution\033[39m"
      else
        puts "\033[31mNo solution\033[39m"
      end
    elsif @degree == 1
      if @polynomial_terms.length > 1
        a = @polynomial_terms[1].value
        b = @polynomial_terms[0].value
      else
        a = @polynomial_terms[0].value
        b = 0
      end
      puts "The solution is:"
      puts "\033[90m-b / a = \033[32m" + (-b / a).to_s + "\033[39m"
    elsif @degree == 2
      if @polynomial_terms.length == 3
        a = @polynomial_terms[2].value
        b = @polynomial_terms[1].value
        c = @polynomial_terms[0].value
      elsif @polynomial_terms.length == 2
        a = @polynomial_terms[1].value
        b = @polynomial_terms[0].value
        c = 0
      elsif @polynomial_terms.length == 1
        a = @polynomial_terms[0].value
        b = 0
        c = 0
      end
      puts "\033[90ma = " + a.to_s + "\033[39m"
      puts "\033[90mb = " + b.to_s + "\033[39m"
      puts "\033[90mc = " + c.to_s + "\033[39m"

      d = b ** 2 - (4 * a * c)
      puts "\033[90md = " + d.to_s + "\033[39m"

      if d > 0
        puts "Discriminant is strictly positive, the two solutions are:"
        puts "\033[90m(-b - (d ** 0.5)) / (2 * a) = \033[32m" + "#{((-b - (d ** 0.5)) / (2 * a)).to_s}" + "\033[39m"
        puts "\033[90m(-b + (d ** 0.5)) / (2 * a) = \033[32m" + "#{((-b + (d ** 0.5)) / (2 * a)).to_s}" + "\033[39m"
      elsif d == 0
        puts "Discriminant is 0, the solution is:"
        puts "\033[90m-b / (2 * a) = \033[32m" + "#{(-b / (2 * a)).to_s}"
      else
        puts "Discriminant is strictly negative, no solutions:"
      end
    end
  end

end