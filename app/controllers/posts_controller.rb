class PostsController < ApplicationController
  before_action :correct_post, only: [:edit, :update]
  before_action :authenticate_user!, only: [:new]

  def search
    @posts = Post.search(params[:search]).page(params[:page]).per(12)
  end
	def new
	  @post = Post.new
	end
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(12)
  end
	def create
  	@post = Post.new(post_params)
    @post.user = current_user
  	if @post.save
  	    redirect_to post_path(@post)
  	else
  		render :new
  	end
  end
  def show
    @post = Post.find(params[:id])
    @lat = @post.latitude
    @lng = @post.longitude
    gon.lat = @lat
    gon.lng = @lng
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.user = current_user
    if @post.update(post_params)
       redirect_to post_path(@post)
    else
      render :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.user = current_user
    if @post.destroy
       redirect_to user_path(current_user.id)
    else
       render :show
    end
  end
  def ranking
    @posts = Post.joins(:likes).group(:post_id).order('count(post_id) desc').page(params[:page]).per(12)
  end
  private
  def post_params
   params.require(:post).permit(:title,
   	                            :image,
   	                            :budget,
   	                            :place,
   	                            :impressions,
   	                            :address,
                                :latitude,
                                :longitude,
                                :image_location
   	                            )
  end

  def correct_post
    @post = Post.find(params[:id])
    if @post.user != current_user
      flash[:alert] = "権限がありません。"
      redirect_to root_path
    end
  end
end
