class PostsController < ApplicationController
	def new
	  @post = Post.new
	end
  def index
    @posts = Post.all
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
