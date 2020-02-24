module CommonActions
  extend ActiveSupport::Concern
  included do
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url,:notice=>"ログインしてください"
    end
  end
  
  module ClassMethods
    def foo
      puts 'foo'
    end
  end
end