class Attachment < ApplicationRecord
  mount_uploader :attachment_file, AttachmentFileUploader

  belongs_to :project

  validates :attachment_file, presence: true
end
