class ApplicationController < ActionController::Base
  # ログイン状態を確認するメソッドの定義はapplicationControllerで行う
  before_action :authenticate
  helper_method :logged_in?, :current_user

  private

   def logged_in?
    # !session[:user_id].nil?
    # !!session[:user_id]
    !!current_user
   end

   def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
   end

   def authenticate
      return if logged_in?
      redirect_to root_path, alert: "ログインしてください"
   end
end
