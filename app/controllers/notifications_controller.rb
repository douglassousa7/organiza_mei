class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all.order(created_at: :desc)
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      # Enfileira o job para enviar a notificação
      SendNotificationJob.perform_later(@notification.id)
      redirect_to notifications_path, notice: "Notificação criada e enviada com sucesso!"
    else
      render :new
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:user, :message)
  end
end
