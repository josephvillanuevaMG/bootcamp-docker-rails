class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save!
      redirect_to users_path
    else
      redirect_back
    end
  end

  def update
    user = User.find(params[:id])
    # user.firstname = user_params[:firstname]
    # user.lastname = user_params[:lastname]
    # user.username = user_params[:username]
    # if user.save!
    if user.update(user_params)
      redirect_to users_path
    else
      redirect_back
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require('user').permit(:firstname, :lastname, :username, :password)
  end
end
