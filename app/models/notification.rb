class Notification < ApplicationRecord
  # Validações
  validates :user, presence: true
  validates :message, presence: true
  validates :status, inclusion: { in: [ "pendente", "enviada" ] }

  # Callbacks
  before_save :set_status

  private

  def set_status
    self.status = if sent_at.present?
                   "enviada"
    else
                   "pendente"
    end
  end
end
