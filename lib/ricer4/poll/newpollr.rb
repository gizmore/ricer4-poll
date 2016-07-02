load File.expand_path("../newpoll_base.rb", __FILE__)
module Ricer4::Plugins::Poll
  class Newpollr < NewpollBase
    
    trigger_is :'poll.hotornot'

    has_usage  '<message|named:"hotornot">'
    def execute(question)
      question = Question.create!({
        text: question,
        user_id: sender.id,
        poll_type: Question::RATE,
      })
      announce(question)
    end

  end
end
