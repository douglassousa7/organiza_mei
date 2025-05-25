class NotificationsController < ApplicationController
  before_action :set_notification, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:status].present?
      @notifications = Notification.where(status: params[:status]).order(created_at: :desc)
    else
      @notifications = Notification.order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to notifications_path, notice: "Notificação criada com sucesso."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @notification.update(notification_params)
      redirect_to notifications_path, notice: "Notificação atualizada com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @notification.destroy
    redirect_to notifications_path, notice: "Notificação excluída com sucesso."
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:user, :message, :sent_at)
  end
end
