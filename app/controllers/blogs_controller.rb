class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    @blog = Blog.new
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.save
  end

  def edit
    @blog = Blog.find(params[:id])
  end


private
  def blog_params
    params.require(:blog).permit(:title, :body, :image)
  end

end
