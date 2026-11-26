class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    if not ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new
    end

    if not (first_operand.is_a?(Integer) and second_operand.is_a?(Integer))
      raise ArgumentError.new
    end

    begin
      case operation
      in '+'
        "#{first_operand} #{operation} #{second_operand} = #{first_operand + second_operand}"
      in '/'
        "#{first_operand} #{operation} #{second_operand} = #{first_operand / second_operand}"
      else
        "#{first_operand} #{operation} #{second_operand} = #{first_operand * second_operand}"
      end
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
    end
  end
end