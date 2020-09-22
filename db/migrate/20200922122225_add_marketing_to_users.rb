class AddMarketingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :allow_marketing, :boolean
  end
end
