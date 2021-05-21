class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.2]
  def change
    change_column :payments, :payment_type, :integer
  end
end
