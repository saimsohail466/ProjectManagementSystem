class AttachmentsController < ApplicationController
  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
    render :new unless @attachment.save
  end

  private

  def attachment_params
    params.require(:attachment).permit(:attachment_file, :project_id)
  end
end
