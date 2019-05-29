class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

  def index
  @user = User.all
  end

  def new
    @user = User.new
  end

  def edit

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

    if @user.update(user_params)
      flash[:success] = "your account was updated successfilly"
      redirect_to articles_path
    else
      render 'new'
    end
end
def show

end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :dateofbirth, :address)
  end
  def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
    if current_user != @user 
      flash[:danger] = "You can edit your own account"
      redirect_to root_path
    end
  end

end
