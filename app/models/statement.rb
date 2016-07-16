class Statement < ApplicationRecord
  belongs_to :user

  def max
    Statement.where(study_mode: study_mode, basis: basis, educational_program: educational_program).maximum(:points)
  end

  def min
    Statement.where(study_mode: study_mode, basis: basis, educational_program: educational_program).minimum(:points)
  end

  def people_by
    Statement.where(study_mode: study_mode, basis: basis, educational_program: educational_program).uniq.pluck(:user_id).length
  end

  def my_raiting
    Statement.where(study_mode: study_mode, basis: basis, educational_program: educational_program).order('points DESC').map(&:id).index(id) + 1
  end
end
