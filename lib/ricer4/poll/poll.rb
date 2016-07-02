###
### Toggles Announce on/off
### Install the plugin
### Close polls automatically
###
module Ricer4::Plugins::Poll
  class Poll < Ricer4::Plugin

    # Copyright
    date_is '2015-11-28'
    author_is :gizmore
    license_is :properitary
    version_is 1

    # Its some real plugin to call
    # Toggles Announce on/off
    is_announce_trigger "poll", :user => :public, :channel => :halfop, :channel_default => false
    
    # Indicate it has some subcommands
    has_subcommands

    # Max poll options
    has_setting name: :max_options, type: :integer, permission: :responsible, scope: :bot, default: 6, min: 1, max: 10
    def max_options; get_setting(:max_options); end
    
    # Close poll timeout
    has_setting name: :lifetime, type: :duration, permission: :responsible, scope: :bot, default: 2.hours
    def max_age; get_setting(:lifetime); end
    def max_age_cut; Time.now - max_age; end
    
    # Close poll thread    
    def plugin_init
      arm_subscribe('ricer/ready') do
        service_threaded do
          loop do
            sleep 60.seconds
            automatically_close_questions
          end
        end
      end
    end
    
    # Close poll query
    def automatically_close_questions
      Question.open.where('poll_questions.created_at < ?', max_age_cut).each do |question|
        automatically_close_question(question)
      end
    end
    
    # Close poll
    def automatically_close_question(question)
      get_plugin('Poll/Close').close_question(question)
    end

  end
end
