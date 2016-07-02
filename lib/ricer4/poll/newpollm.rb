load File.expand_path("../newpoll_base.rb", __FILE__)
module Ricer4::Plugins::Poll
  class Newpollm < NewpollBase
    
    trigger_is :'+multiplechoice'

    has_usage  '<poll_data>', function: :execute
    def execute(message)
      
      create_poll(message, Question::MULTI)
      
    end

  end
end
