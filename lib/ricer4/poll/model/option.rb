module Ricer4::Plugins::Poll
  class Option < ActiveRecord::Base
    
    MAXLEN ||= 48
    
    self.table_name = 'poll_options'
    
    belongs_to :question, :class_name => "Ricer4::Plugins::Poll::Question"
    has_many   :answers,  :class_name => "Ricer4::Plugins::Poll::Answer"

    # Validate option texts unless a HotOrNot    
    validates :choice, length: { 
      minimum: 1, maximum: MAXLEN },
      :unless => Proc.new { |option| option.question.poll_type == Question::RATE }

    # Validate int_value if it's a HotOrNot    
    validates :int_value, :numericality => {
      greater_than_or_equal_to: 1, less_than_or_equal_to: 10, only_integer: true },
      :unless => Proc.new { |option| option.question.poll_type != Question::RATE }
    
    arm_install do |m|
      m.create_table table_name do |t|
        t.integer  :question_id, :null => false
        t.string   :choice,      :null => true, :length => MAXLEN
        t.integer  :int_value,   :null => true, :limit => 1, :unsigned => true
      end
    end
    
  end
end
