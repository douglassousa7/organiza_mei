class LembreteMailer < ApplicationMailer
  def lembrete_cliente(cliente)
    @cliente = cliente  # Variável de instância para a view
    mail(
      to: @cliente.email,
      subject: "Lembrete Importante"
    )
  end
end
