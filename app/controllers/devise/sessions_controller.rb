class Devise::SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
  	user = User.find_by(email: params[:user][:email])
  	if user.present?
  	  status = user.valid_password?(params[:user][:password])
      if status == true
  	  	sign_in(user)
        flash[:success] = "Login Successful."
        redirect_to "/index"
      else
        flash[:danger] = "Invalid Login Credentials"
      end
    else
      flash[:danger] = "Invalid login credentials."
      redirect_to "/login"
    end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    redirect_to new_user_registration_path
  end
end
