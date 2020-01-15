class UsersController < ApplicationController
  before_action :require_user_logged_in, exept: %w[new create]
  before_action :set_user, only: %w[follows followers userlikes]
  def new; @user = User.new; end
  def show; @user = User.find(params[:id]);end
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
  def follows
  end
  def followers
  end
  def userslikes
  end
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:avatar)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
