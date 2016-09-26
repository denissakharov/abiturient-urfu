class UsersController < ApplicationController
  before_action :update_monitor, only: [:index, :show]

  def index
    @users = Statement.select(:name, :number).distinct.search_everywhere(params[:query]).reorder(:name).distinct
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = Statement.find_by_number(params[:number])
    if @user.nil?
      render file: 'public/404', status: 404, formats: [:html]
    else
      @statements = Statement.where(number: params[:number])
    end
  end

  def update
    if Statement.all.empty? || Statement.maximum(:created_at) >= Time.now - 1.minute || Statement.minimum(:created_at) <= Time.now - 1.day
      timer = 5 - ((Statement.maximum(:created_at) - Statement.minimum(:created_at)) / 60).round unless Statement.all.empty?
      @minutes = if timer.nil?
                   5
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
