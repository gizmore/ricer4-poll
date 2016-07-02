load File.expand_path("../newpoll_base.rb", __FILE__)
module Ricer4::Plugins::Poll
  class Newpoll < NewpollBase
    
    trigger_is :'+poll'

    has_usage  '<poll_data>', function: :execute
    def execute(message)
      create_poll(message, Question::POLL)
    end

  end
end
