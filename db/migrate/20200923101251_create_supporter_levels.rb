class CreateSupporterLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :supporter_levels do |t|
      t.string :name
      t.decimal :ammount, :precision => 6, :scale => 2

      t.timestamps
    end
  end
end
