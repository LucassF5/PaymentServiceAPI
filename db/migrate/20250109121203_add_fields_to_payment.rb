class AddFieldsToPayment < ActiveRecord::Migration[8.0]
  def change
    add_column :payments, :status, :integer, default: 0, null: false
    add_column :payments, :attempts, :integer, default: 0
    add_column :payments, :failure_reason, :string
  end
end
