class UsersController < ApplicationController
  before_action :require_user_logged_in, except: %w[new create]
  before_action :set_user, only: %w[show edit update]
  before_action :set_nest_user, only: %w[follows followers userlikes userposts]

  def new
    @user = User.new
  end

  def show; end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザの登録をしました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'ユーザの登録をしました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render edit_user_path(@user)
    end
  end

  def follows
    @follows = @user.followings.with_attached_avatar
  end

  def followers
    @followers = @user.followers.with_attached_avatar
  end

  def userlikes
    @restaurants = @user.restaurants
  end

  def userposts
    @comments = @user.comments.includes(:restaurant).with_attached_images
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_nest_user
    @user = User.find(params[:user_id])
  end
end
