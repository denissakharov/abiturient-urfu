module Api
  class StatementsController < ApplicationController
    def search
      @statements =
        Statement.where(study_mode: search_params[:study_mode],
                        basis: search_params[:basis],
                        educational_program: search_params[:educational_program])
      render json: @statements.order('points DESC')
    end

    def statistics
      statements = Statement.where(study_mode: search_params[:study_mode],
                                   basis: search_params[:basis],
                                   educational_program: search_params[:educational_program])

      @statistics = {  min: statements.minimum(:points),
                       max: statements.maximum(:points),
                       users_quantity: statements.uniq.pluck(:number).length,
                       user_raiting: statements.order('points DESC').map(&:number).index(search_params[:number].to_i) + 1  }
      render json: @statistics
    end

    def status
      statements_quantity = Statement.select(:number).count
      users_quantity = Statement.select(:number).distinct.count
      last_update = Statement.minimum(:created_at)
      db_status = WorkingStatus.find_by_name('Update status')
      sc = WorkingStatus.find_by_name('Statements count')

      @status = { status: 'updated',
                  statements: statements_quantity,
                  users: users_quantity,
                  last_update: last_update.strftime('%d.%m.%Y в %H:%M'),
                  progress: 100
                }

      render json: @status
    end

    private

    def search_params
      params.permit(:basis, :educational_program, :number, :study_mode)
    end
  end
end
