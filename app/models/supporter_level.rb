class SupporterLevel < ApplicationRecord
  has_many :users
	validates :name, :amount, :description, presence: true
	has_many_attached :rewards
	has_many :subscriptions
end
