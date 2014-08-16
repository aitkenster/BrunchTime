class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  has_many :luvits

  validates :reviewer, presence: true
  validates :rating, presence: true, inclusion: (1..5)
  validates :user_id, uniqueness: {scope: :restaurant_id}
  
end
