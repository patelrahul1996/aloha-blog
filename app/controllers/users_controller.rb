class UsersController < ApplicationController
  def index
  @user = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
       render 'new'
     end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "your account was updated successfilly"
      redirect_to articles_path
    else
      render 'new'
    end
end
def show
  @user = User.find(params[:id])
end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :dateofbirth, :address)
  end
end
