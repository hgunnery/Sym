class SupporterLevel < ApplicationRecord
  has_many :users
	validates :name, :ammount, :description, presence: true
end
