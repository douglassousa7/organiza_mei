class Atendimento < ApplicationRecord
  belongs_to :cliente

  after_create :enviar_email_lembrete

  private

  def enviar_email_lembrete
    LembreteMailer.lembrete_cliente(cliente).deliver_later
  end
end
