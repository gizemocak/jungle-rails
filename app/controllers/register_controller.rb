class RegisterController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:admin, :products]
    else
      render :index
    end
  end

  private 
  
  def user_params
    params.require(:register).permit(
      :email,
      :password,
      :first_name,
      :last_name
    )
  end
end
