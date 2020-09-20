class PostsController < ApplicationController
	def new
	  @post = Post.new
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