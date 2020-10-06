class AddVoteCountToSuggestions < ActiveRecord::Migration[6.0]
  def change
		add_column :suggestions, :vote_count, :integer, default: 0
  end
end
