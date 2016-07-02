module Ricer4::Plugins::Poll
  class Answer < ActiveRecord::Base
    
    self.table_name = 'poll_answers'
    
    belongs_to :user,   :class_name => 'Ricer4::User'
    belongs_to :option, :class_name => "Ricer4::Plugins::Poll::Option"
    
    arm_install do |m|
      m.create_table table_name do |t|
        t.integer   :user_id,    :null => false
        t.integer   :option_id,  :null => false
        t.timestamp :created_at, :null => false
      end
    end
    
  end
end
