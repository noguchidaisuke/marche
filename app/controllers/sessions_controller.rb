class SessionsController < ApplicationController
  def twitter_create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def create
    binding.pry
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'メールアドレスかパスワードが間違っています。'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
