class SessionsController < ApplicationController
  def new

  end

  def create
  	@user = User.find_by(email: params[:email])
  	if @user && @user.authenticate(params[:password])
  		redirect_to root_path, notice: "Login successfull"
  	else
  		raise 'wrong password or some shit'
  	end
  end

  def destroy
  end


end
