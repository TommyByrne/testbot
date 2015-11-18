class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :channel_type
      t.string :name, default: 'standups'
      t.integer :bot_id
      t.string :bot_name
      t.string :web_url

      t.timestamps null: false
    end
  end
end
