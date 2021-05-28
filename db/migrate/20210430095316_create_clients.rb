class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.text :firstname
      t.text :lastname
      t.text :email
      t.text :street
      t.text :city
      t.text :country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
