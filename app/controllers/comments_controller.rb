class CommentsController < ApplicationController

  def create
    @post=Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.name = current_user.name
    @comment.save
    redirect_to @post
  end

    def destroy
      @post=Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to @post
    end

    def edit
    end
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
