class CommentsController < ApplicationController
  before_action :find_comment, only: [:like, :unlike]

  def index
  end

  def show
  end

  def like
    @like = @comment.like!(current_user.id)
    respond_to do |format|
      format.js { render json: @like }
    end
  end

  def unlike
    @like = @comment.unlike!(current_user.id)
    respond_to do |format|
      format.js { render json: @like }
    end
  end

  def create
    @comment = params[:comment][:commentable_type].titleize.constantize.find(params[:comment][:commentable_id]).comment( params[:content], current_user )
    @comment.update_attributes(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end