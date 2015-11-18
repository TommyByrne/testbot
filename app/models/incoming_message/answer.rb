require_relative 'simple'

class IncomingMessage
  class Answer < Simple
    def execute
      super

      if @standup.active? && yes?
        @standup.start!

        @client.message channel: @message['channel'], test: @standup.current_question

      elsif @standup.answering?
        @standup.process_answer(@message['text'])

        if @standup.completed?
          @client.message channel: @message['channel'], text: 'Make Headway Today!'
        else
          @client.message channel: @message['channel'], text: @standup.current_question
        end
      end
    end

    def validate!
      if !@standup.in_progress?
        raise InvalidCommand.new('You can not answer a questiong before your turn.')
      end

      super
    end

    private

    def yes?
      MessageType.new(@message['text']).yes?
    end
  end
end