class DropAttachmentsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :attachments
  end
end
