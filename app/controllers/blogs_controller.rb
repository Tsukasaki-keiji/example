class BlogsController < ApplicationController
before_action :authenticate_user!, only: [:edit, :new, :create, :show]
  def index
    @blogs = Blog.all
    @blog = Blog.new
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to @blog, notice: "You have created book successfully."
    else
      flash[:danger] = @blog.errors.full_messages
      @blogs = Blog.all
      render 'index'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    if current_user.id != @blog.user_id
      redirect_to blogs_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @post_comments = @blog.post_comments
    @post_comment = current_user.post_comments.new
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.user_id == current_user.id
      @blog.destroy!
      redirect_to blog_path
    else
      redirect_to blog_path
    end
  end

private
  def blog_params
    params.require(:blog).permit(:title, :body, :image, :post_comments)
  end

end
