class Notification < ApplicationRecord
  # Validações
  validates :user, presence: true
  validates :message, presence: true
  validates :status, inclusion: { in: [ "pendente", "enviada" ] }

  # Callbacks
  before_save :set_status

  private

  def set_status
    self.status = sent_at.present? ? "enviada" : "pendente"
  end
end
