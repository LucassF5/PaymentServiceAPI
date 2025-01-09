class Payment < ApplicationRecord
  validates :amount, :card_number, :name, :security_code, :valid_date, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :card_number, length: { is: 16 }
  validates :name, length: { in: 3..50 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "deve conter apenas letras e espaços" }
  validates :security_code, length: { is: 3 }
  validates :valid_date, format: { with: /\A\d{2}\/\d{4}\z/, message: "precisa estar no formato MM/YYYY" }
end
