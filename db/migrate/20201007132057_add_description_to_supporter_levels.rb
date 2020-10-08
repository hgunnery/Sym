class AddDescriptionToSupporterLevels < ActiveRecord::Migration[6.0]
  def change
    add_column :supporter_levels, :description, :text
  end
end
