class AddDefaultStatusToNotifications < ActiveRecord::Migration[7.0]
  def change
    change_column_default :notifications, :status, "pendente"
  end
end
