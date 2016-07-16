class StatementsController < ApplicationController
  def index
    unless params[:study_mode].nil?
      @statements = Statement.where(study_mode: params[:study_mode],
                                    basis: params[:basis],
                                    educational_program: params[:educational_program])
                                    .order('points DESC')
    end
  end

  def update
    User.update_statements
    render text: 'OK'
  end
end
