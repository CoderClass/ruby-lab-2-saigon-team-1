class WelcomeController < ApplicationController
  def index
  end

  def create
  	@user = User.new user_params
  	if @user.save
  		flash[:success] = "User created successfully"
  		session[:user_id] = @user.id
  		redirect_to @user
  	else
  		flash[:error] = @user.errors.full_messages.to_sentence
  		redirect_to new_user_path
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :image_url, :password)
  end
end
