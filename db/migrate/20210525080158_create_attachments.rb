class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.text :attachment_file
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
