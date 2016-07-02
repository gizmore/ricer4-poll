class ActiveRecord::Magic::Param::ClosedQuestion < ActiveRecord::Magic::Param::Id
    
  def input_to_value(input)
    Ricer4::Plugins::Poll::Question.closed.where(:id => input).first
  end

  def value_to_input(question)
    question.id rescue nil
  end
    
end
