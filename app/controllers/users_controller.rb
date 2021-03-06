class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    redirect_to materials_path unless @user.id == current_user.id
  end
end
