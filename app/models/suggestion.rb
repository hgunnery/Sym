class Suggestion < ApplicationRecord
	has_many :votes, dependent: :destroy
	belongs_to :user
	validates :name, :description, presence: true
end
