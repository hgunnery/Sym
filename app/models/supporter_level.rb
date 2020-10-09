class SupporterLevel < ApplicationRecord
  has_many :users
	validates :name, :ammount, :description, presence: true
	has_many_attached :rewards
end
