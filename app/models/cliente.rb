class Cliente < ApplicationRecord
  has_many :atendimentos, dependent: :destroy
end
