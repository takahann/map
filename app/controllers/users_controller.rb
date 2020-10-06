class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
	  @users = User.all
  end
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.all.order(created_at: :desc)
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: '更新しました'
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:email, :name, :introduction, :user_image )
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:alert] = "権限がありません。"
      redirect_to root_path
    end
  end
end
