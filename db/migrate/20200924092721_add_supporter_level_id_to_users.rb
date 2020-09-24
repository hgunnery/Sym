class AddSupporterLevelIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :supporter_level_id, :integer
  end
end
