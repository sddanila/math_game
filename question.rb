class Question
  attr_reader :question, :answer

  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
  end

  def question
  'What does ' + @number1.to_s + ' plus ' + @number2.to_s + ' equal?'
  end

  def answer
    answer = @number1 + @number2
    return answer.to_s
  end


end