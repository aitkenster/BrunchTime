class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :user
	
	validates :name, presence: true, length: { minimum: 3 }
	validates :cuisine, presence: true, length: {minimum: 3}

	def average_rating
		return 'N/A' if reviews.none? || reviews.all?(&:new_record?)
		reviews.average(:rating).to_f
	end

end
