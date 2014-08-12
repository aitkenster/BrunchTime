class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :user
	
	validates :name, presence: true, length: { minimum: 3 }
	validates :cuisine, presence: true, length: {minimum: 3}
end
