class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(notification_id)
    notification = Notification.find(notification_id)

    # Aqui seria o envio real da notificação: email, SMS, push, etc.
    puts "📢 Notificando #{notification.user}: #{notification.message}"

    # Marcar como enviada
    notification.update(sent_at: Time.current)
  end
end
