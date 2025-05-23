class Notification < ApplicationRecord
  before_save :set_status

  private

  def set_status
    if sent_at.present?
      self.status = "enviada"
    else
      self.status = "pendente"
    end
  end
end
