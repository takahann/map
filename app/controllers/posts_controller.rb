class PostsController < ApplicationController

  def search
    @posts = Post.search(params[:search])
  end
	def new
	  @post = Post.new
	end
  def index
    @posts = Post.all.order(created_at: :desc)
  end
	def create
  	@post = Post.new(post_params)
    @post.user = current_user
  	if  @post.save
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
    if @post.update(post_params)
       redirect_to post_path(@post)
    else
      render :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  def ranking
    @posts = Post.find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
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
                                :longitude
   	                            )
  end
end
