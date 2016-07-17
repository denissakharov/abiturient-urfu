class UsersController < ApplicationController
  before_action :update_monitor, only: [:index, :show]

  def index
    @users = User.search_everywhere(params[:query])
  end

  def show
    @user = User.find_by_number(params[:number])
    @statements = @user.statements
  end

  def update
    if Statement.maximum(:created_at) + 1.minute >= Time.now || Statement.minimum(:created_at) <= Time.now - 1.day
      timer = 20 - ((Statement.maximum(:created_at) - Statement.minimum(:created_at)) / 60).round
      @minutes = timer < 0 ? 0 : timer
    else
      redirect_to root_path
    end
  end
end
