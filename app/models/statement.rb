class Statement < ApplicationRecord
  extend Parser

  include PgSearch
  pg_search_scope :search_everywhere, against: [:name, :number]

  belongs_to :user

  def max
    statements = Statement.where(study_mode: study_mode,
                                 basis: basis,
                                 educational_program: educational_program)
    statements.maximum(:points)
  end

  def min
    statements = Statement.where(study_mode: study_mode,
                                 basis: basis,
                                 educational_program: educational_program)
    statements.minimum(:points)
  end

  def people_by
    statements = Statement.where(study_mode: study_mode,
                                 basis: basis,
                                 educational_program: educational_program)
    statements.uniq.pluck(:number).length
  end

  def my_raiting
    statements = Statement.where(study_mode: study_mode,
                                 basis: basis,
                                 educational_program: educational_program)
    statements.order('points DESC').map(&:number).index(number) + 1
  end
end
