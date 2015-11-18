require_relative 'compound'

class IncomingMessage
  class NotAvailable < Compound
    def execute
      super

      if @standup.active?
        @standup.not_available!

        @client.message channel: @message['channel'], text: "<@#{reffered_user.slack_id}> is not available."
      end

      def validate!
        if !user.admin?
          raise InvalidCommand.new("You don't have permission to set this user not available.")
        elsif @standup.completed?
          raise InvalidCommand.new("<@#{reffered_user.slack_id}> has already completed standup today.")
        elsif @standup.answering?
          raise InvalidCommand.new("<@#{reffered_user.slack_id}> is doing their standup.")
        end

        super
      end
    end
  end
  