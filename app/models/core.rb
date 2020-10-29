class Core < ApplicationRecord
	validates :homepage_title, :homepage_content, :homepage_about, presence: true
	# validates :sm_youtube_link, presence: true, if: self.sm_youtube == true
	# validates :sm_twitter_link, presence: true, if: self.sm_twitter == true
	# validates :sm_facebook_link, presence: true, if: self.sm_facebook == true
	# validates :sm_instagram_link, presence: true, if: self.sm_instagram == true
	has_one_attached :banner
	has_one_attached :avatar
end
