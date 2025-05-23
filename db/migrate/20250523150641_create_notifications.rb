class CreateNotifications < ActiveRecord::Migration[8.0]
  def change
    create_table :notifications do |t|
      t.string :user
      t.string :message
      t.datetime :sent_at

      t.timestamps
    end
  end
end
