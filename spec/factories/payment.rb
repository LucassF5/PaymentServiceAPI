FactoryBot.define do
  factory :payment do
    name { "Lucas" }
    card_number { 1234567812345678 }
    valid_date { '01/25' }
    security_code { 123 }
    amount { "9.99" }
  end
end
