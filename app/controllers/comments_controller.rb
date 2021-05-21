class CommentsController < ApplicationController
  before_action :user_signed?
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      if @comment.commentable_type == "Project"
        redirect_to project_path(@comment.commentable_id)
      elsif @comment.commentable_type == "Timelog"
        redirect_to timelog_path(@comment.commentable_id)
      elsif @comment.commentable_type == "Payment"
        redirect_to payment_path(@comment.commentable_id)
      end 
    else
      render :form
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
     # here we need some checks because comments are having ploymorphic behaviour..
      redirect_to project_path(@comment.commentable_id) , notice: "Comment updated Successfully.."
    else
      render :form
    end  
  end

  def destroy
    if @comment.destroy
      # here also..
       redirect_to project_path(@comment.commentable_id), notice: "Comment Delete Successfully.."
     end 
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id, :user_id)
  end
end
