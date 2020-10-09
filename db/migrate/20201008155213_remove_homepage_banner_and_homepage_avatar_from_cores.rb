class RemoveHomepageBannerAndHomepageAvatarFromCores < ActiveRecord::Migration[6.0]
  def change
		remove_column :cores, :homepage_avatar, :string
		remove_column :cores, :homepage_banner, :string
  end
end
