class Devise::RegistrationsController < ApplicationController
  before_action :user_login, only: [:new,:create]
  # GET /resource/sign_up
  def new
    @user  =User.new
    @date = Time.now().strftime("%B %d, %Y")
  end

  # POST /resource
  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "You Registered Successfully"
      redirect_to new_user_session_path
    else
      unless params[:user][:password] == params[:user][:password_confirmation]
        flash[:danger] = "Password and Password Confirmation must be same."
        redirect_to new_user_registration_path(user: { email: params[:user][:email], password: params[:user][:password],password_confirmation: params[:user][:password_confirmation]})
      else
        flash[:danger] = "Email should be unique and valid"
        redirect_to new_user_registration_path(user: { email: params[:user][:email], password: params[:user][:password],password_confirmation: params[:user][:password_confirmation]})
      end
    end
  end

  private

  def user_login
   if current_user
     redirect_to index_path
   end
  end
  def user_params
    user_params = params.require(:user).permit( :email, :password, :password_confirmation)
  end
end
