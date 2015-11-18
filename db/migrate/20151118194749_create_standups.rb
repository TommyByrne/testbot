class CreateStandups < ActiveRecord::Migration
  def change
    create_table :standups do |t|
      t.text :yesterday
      t.text :today
      t.text :conflicts
      t.references :channel, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :order,      default: 1
      t.string :state

      t.timestamps null: false
    end
  end
end
