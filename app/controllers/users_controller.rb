class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find_by_number(params[:number])
    @statements = @user.statements
  end
end
