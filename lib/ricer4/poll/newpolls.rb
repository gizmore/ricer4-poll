module Ricer4::Plugins::Poll
  class Newpolls < Ricer4::Plugin
    
    is_list_trigger :newpolls, :for => Ricer4::Plugins::Poll::Question.open

  end
end
