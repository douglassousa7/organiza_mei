class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all.order(created_at: :desc)
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.status = "pendente" # Define status padrão

    if @notification.save
      # Enfileira o job para enviar a notificação
      SendNotificationJob.perform_later(@notification.id)
      redirect_to notifications_path, notice: "Notificação criada e enviada com sucesso!"
    else
      render :new
    end
  end

  def mark_as_sent
    @notification = Notification.find(params[:id])
    if @notification.update(status: "enviada", sent_at: Time.current)
      redirect_to notifications_path, notice: "Notificação marcada como enviada!"
    else
      redirect_to notifications_path, alert: "Erro ao marcar notificação!"
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:user, :message, :status)
  end
end
