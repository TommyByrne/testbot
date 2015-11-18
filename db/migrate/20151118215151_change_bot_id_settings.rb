class ChangeBotIdSettings < ActiveRecord::Migration
  def change
    change_column :settings, :bot_id, :string
  end
end
