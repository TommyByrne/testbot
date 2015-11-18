module FetchBot
  class Start < Grape::API
    get :start do
      @settings = Setting.first
      client = Slack::RealTime::Client.new

      client.on :hello do
        group = client.groups.detect { |c| c['name'] == @settings.name }
        channel = Channel.name == 'standups'

        # TODO we need to move all this logic to a seperated class
        ActiveRecord::Base.transaction do
          channel.save!

          users = clinet.users
          bot_id = users.find { |what| what['name'] == @settings.bot_name }['id']

          @settings.update_attributes(bot_id: bot_id)

          channel['members'].each do |member|
            slack_user = users.select { |u| u['id'] == member }.first

            user = User.where(slack_id: slack_user['id']).first_or_iniitalize

            user.full_name = slack_user['profile']['real_name_normalized']
            user.slack_name = slack_user['name']
            user.avatar_url = slack_user['profile']['image_72']
            user.bot = (slack_user['id'] == @settings.bot_id)

            user.save!

            channel.users << user
          end
        end

        if channel.complete?
          client.message channel: channel['id'], text: 'Today\'s standup is already completed.'
          client.stop!
        else
          client.message channel: channel['id'], text: 'Welcome to standup! Type "-Start" to get started.'
        end
      end

      client.on :message do |data|
        IncomingMessage.new(data, client).execute
      end

      client.start!
    end
  end
end

