class UsersController < ApplicationController
  def index
    @users = if params[:search].nil?
               User.joins(:statements)
                   .select('statements.user_id', 'users.*')
                   .where('statements.points >= 290')
                   .group('users.id, statements.user_id')
             else
               User.where(name: params[:search][:name])
             end
  end

  def show
    @user = User.find_by_number(params[:number])
    @statements = @user.statements
  end
end
