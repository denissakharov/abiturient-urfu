class StatementsController < ApplicationController
  def index
    @statements =
      Statement.where(study_mode: params[:study_mode],
                      basis: params[:basis],
                      educational_program: params[:educational_program])
    @statements = @statements.order('points DESC')

    if @statements.empty?
      @statements = Statement.order('points DESC').limit(100)
    end

    @title = "#{@statements.first.educational_program} - "
    @title << "#{@statements.first.study_mode} форма обучения"

    @description = 'Рейтинговый список по направлению '
    @description << @statements.first.specialty
    @description << ', образовательная программа: '
    @description << @statements.first.educational_program
    @description << ". #{@statements.first.study_mode} форма обучения, "
    @description << "#{@statements.first.basis}."

    render inline: "<%= react_component('Statements', {statements: @statements}, prerender: true) %>", layout: 'application'
  end

  def update
    db_status = WorkingStatus.find_by_name('Update status')
    if db_status.content == 'starting'
      db_status.update_attributes(content: 'updating')
      Statement.delete_all
      Statement.get_statements
      db_status.update_attributes(content: 'updated')
      render text: 'OK'
    else
      render text: 'FUCK YOU!'
    end
  end

  def sitemap
    respond_to do |format|
      format.xml
      format.html { redirect_to root_url }
    end
  end
end
