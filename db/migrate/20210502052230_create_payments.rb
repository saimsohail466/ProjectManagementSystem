class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :project, foreign_key: true
      t.decimal :amount
      t.text :title
      t.text :description
      t.integer :payment_type

      t.timestamps
    end
  end
end
