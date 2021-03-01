class PostCommentsController < ApplicationController

  def create
    @post_comment = current_user.post_comments.new(post_comment_params)
    if @post_comment.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to blog_path(params[:blog_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:post_comment_content, :blog_id)
  end

end
