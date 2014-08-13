class PostsController < ApplicationController
  before_action :find_post, only: [:like, :unlike, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    respond_to do |format|
      if @post.save
        @post.update_attribute(:user_id, current_user.id)
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def like
    @like = @post.like!(current_user.id)
    respond_to do |format|
      format.js { render json: @like }
    end
  end

  def unlike
    @like = @post.unlike!(current_user.id)
    respond_to do |format|
      format.js { render json: @like }
    end
  end

  def destroy
    @post.destroy
    @post.comments.each do |comment|
      comment.destroy
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :owner_id)
  end

end