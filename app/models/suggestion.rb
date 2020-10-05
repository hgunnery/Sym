class Suggestion < ApplicationRecord
	has_many :votes, dependent: :destroy
end
