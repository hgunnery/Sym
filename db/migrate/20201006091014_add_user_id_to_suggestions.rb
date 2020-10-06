class AddUserIdToSuggestions < ActiveRecord::Migration[6.0]
  def change
		add_column :suggestions, :user_id, :integer
  end
end
