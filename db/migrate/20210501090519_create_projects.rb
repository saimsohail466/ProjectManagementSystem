class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :question
      t.date :start_date
      t.date :deadline
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
