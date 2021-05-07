class DropResourses < ActiveRecord::Migration[5.2]
  def change
    drop_table :resourses
  end
end
