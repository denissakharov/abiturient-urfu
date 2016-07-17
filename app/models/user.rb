class User < ApplicationRecord
  include PgSearch
  pg_search_scope :search_everywhere, against: [:name, :number]

  has_many :statements
end
