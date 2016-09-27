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

      @status = if  Time.now < last_update + 1.day && db_status.content == 'updated'
                  {
                    status: 'updated',
                    statements: statements_quantity,
                    users: users_quantity,
                    last_update: last_update.strftime('%d.%m.%Y в %H:%M'),
                    progress: 100
                  }
                elsif db_status.content == 'updating'
                  {
                    status: 'updating',
                    progress: statements_quantity.to_f / sc.content.to_f * 100.0
                  }
                elsif db_status.content == 'updated'
                  db_status.update_attributes(content: 'starting')
                  sc.update_attributes(content: statements_quantity)
                  { status: 'starting', progress: 100 }
                end

      render json: @status
    end

    private

    def search_params
      params.permit(:basis, :educational_program, :number, :study_mode)
    end
  end
end
