class PolynomialTerm
  attr_reader :value, :degree

  def initialize(value, degree)
    @value = value
    @degree = degree
  end

  def +(polynomial_term)
    value = self.value + polynomial_term.value
    PolynomialTerm.new(value, self.degree)
  end

  def -(polynomial_term)
    value = self.value - polynomial_term.value
    PolynomialTerm.new(value, self.degree)
  end

  def to_s
    puts "PolynomialTerm instance\n" +
             "attrs:\n" +
             "value: #{self.value.to_s}, " + "degree: #{self.degree.to_s}"
  end
end