module Ricer4::Plugins::Poll
  class Polls < Ricer4::Plugin
    
    is_list_trigger :polls, :for => Question.closed
    
  end
end
