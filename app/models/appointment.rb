class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :title, :scheduled_for, presence: true
end
