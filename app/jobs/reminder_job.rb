class ReminderJob < ApplicationJob
  queue_as :default

  def perform(appointment_id)
    appointment = Appointment.find_by(id: appointment_id)
    return unless appointment

    puts "🔔 Lembrete: Você tem um agendamento com #{appointment.client.name} às #{appointment.scheduled_for.strftime("%H:%M")}!"
    # Aqui no futuro você pode usar ActionMailer ou notificações
  end
end
