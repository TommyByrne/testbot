class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :slack_id, :string
      t.column :full_name, :string
      t.column :slack_name, :string
      t.column :admin, :boolean, default: false
      t.column :bot, :boolean, default: false
      t.column :avatar_url, :string
      
      t.timestamps null: false
    end
  end
end
