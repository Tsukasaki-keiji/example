class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :create, :show]

  def index
    @videos = Video.all
    @vodeo = Video.new
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.save
    redirect_to blogs_path
  end

  def show
    @video = Video.find(params[:id])
  end

  private

   def video_params
     params.require(:video).permit(:title, :introduction, :video)
   end

end
