load File.expand_path("../newpoll_base.rb", __FILE__)
module Ricer4::Plugins::Poll
  class Newpollq < NewpollBase
    
    trigger_is 'poll.ask'

    has_usage  '<message|named:"question">'
    def execute(question)
      question = Question.create!({
        text: question,
        user_id: sender.id,
        poll_type: Question::QUESTION,
      })
      announce(question)
    end

  end
end
