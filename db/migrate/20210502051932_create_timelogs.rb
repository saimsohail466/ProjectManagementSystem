class CreateTimelogs < ActiveRecord::Migration[5.2]
  def change
    create_table :timelogs do |t|
      t.references :project, foreign_key: true
      t.text :date_of_log
      t.references :user, foreign_key: true
      t.integer :working_hours
      t.text :task_name
      t.text :task_description

      t.timestamps
    end
  end
end
