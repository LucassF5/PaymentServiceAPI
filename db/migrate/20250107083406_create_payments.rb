class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.bigint :card_number
      t.string :valid_date
      t.integer :security_code, limit: 3
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
