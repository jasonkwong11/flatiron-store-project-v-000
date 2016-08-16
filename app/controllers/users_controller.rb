class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to store_path, :alert => "Access denied."
    end
  end

  def sign_out
    session.clear
    redirect_to store_path
  end
end