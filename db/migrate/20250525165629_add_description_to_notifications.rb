class AddDescriptionToNotifications < ActiveRecord::Migration[8.0]
  def change
    add_column :notifications, :description, :text
  end
end
