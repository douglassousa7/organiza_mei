class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    @appointments = current_user.appointments.includes(:client).order(scheduled_for: :asc)
  end

  def show
  end

  def new
    @appointment = current_user.appointments.build
  end

  def edit
  end

  def create
    @appointment = current_user.appointments.build(appointment_params)

    if @appointment.save
      # Agenda o job para 1 hora antes do horário agendado
      ReminderJob.set(wait_until: @appointment.scheduled_for - 1.hour).perform_later(@appointment.id)

      redirect_to @appointment, notice: "Agendamento criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: "Agendamento atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy!
    redirect_to appointments_url, notice: "Agendamento removido com sucesso."
  end

  private

  def set_appointment
    @appointment = current_user.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:title, :description, :scheduled_for, :client_id)
  end
end
