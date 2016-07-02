class ActiveRecord::Magic::Param::OpenQuestion < Ricer4::Parameter
    
  def input_to_value(input)
    Ricer4::Plugins::Poll::Question.open.where(:id => input).first
  end

  def value_to_input(question)
    question.id rescue nil
  end
  
end
