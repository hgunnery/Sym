class RemoveVotesFromSuggestions < ActiveRecord::Migration[6.0]
  def change
		remove_column :suggestions, :votes, :integer, default: 1
  end
end
