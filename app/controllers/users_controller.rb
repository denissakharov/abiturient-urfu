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
    if Statement.all.empty? || Statement.maximum(:created_at) >= Time.now - 1.minute || Statement.minimum(:created_at) <= Time.now - 1.day
      timer = 20 - ((Statement.maximum(:created_at) - Statement.minimum(:created_at)) / 60).round unless Statement.all.empty?
      @minutes = if timer.nil?
                   20
                 elsif timer < 0
                   1
                 else
                   timer
                 end
    else
      redirect_to root_path
    end
  end
end
