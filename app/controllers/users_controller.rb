class UsersController < ApplicationController
  def index
    @users = Statement.select(:name, :number)
    @users = @users.distinct.search_everywhere(search_params[:name])
    @users = @users.reorder(:name).distinct

    @description = 'Рейтинговые списки абитуриентов УрФУ. Бережно взятые с официального сайта и представленые в удобном виде. Сайт ежедневно обновляется с мая по сентябрь.'

    respond_to do |format|
      format.json { render json: @users }
      format.html { render inline: "<%= react_component 'Users', users: @users %>", layout: 'application' }
    end
  end

  def show
    @user = Statement.find_by_number(params[:number])
    if @user.nil?
      render file: 'public/404', status: 404, formats: [:html]
    else
      @statements = Statement.where(number: params[:number])
      @title = @user.name
      @description = "#{@statements.first.study_mode} форма обучения, #{@statements.first.basis} по образовательной программе #{@statements.first.educational_program} с суммой конкурсных баллов #{@statements.first.points}"

      render inline: "<%= react_component 'UserStatementList', statements: @statements %>", layout: 'application'
    end
  end

  private

  def search_params
    params.permit(:name)
  end
end
