class Review < ActiveRecord::Base
  belongs_to :restaurant
  has_many :luvits

  validates :reviewer, presence: true
  validates :rating, presence: true, inclusion: (1..5)
  
end
