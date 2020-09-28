class HomesController < ApplicationController
  def top
  	@posts = Post.all.order(created_at: :desc)
  	@post = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def about
  end
end
