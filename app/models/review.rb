class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates :reviewer, presence: true
  validates :rating, presence: true
end
