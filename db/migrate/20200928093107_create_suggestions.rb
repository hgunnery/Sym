class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
      t.string :name
      t.text :description
      t.integer :votes, default: 1
      t.boolean :completed, default: false
      t.boolean :banned, default: false
			t.text :banned_reason
      t.boolean :admin_suggested

      t.timestamps
    end
  end
end
