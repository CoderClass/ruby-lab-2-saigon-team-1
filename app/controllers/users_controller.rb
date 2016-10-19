class UsersController < ApplicationController

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "User created successfully"
  		session[:user_id] = @user.id
  		redirect_to @user
  	else
  		flash[:error] = @user.errors.full_messages.to_sentence
  		render 'new'
  	end
  end


  def index
    @users = User.all.shuffle
  end

  def new
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :image_url, :password)
  end

end
