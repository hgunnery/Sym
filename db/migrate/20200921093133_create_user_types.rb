class CreateUserTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_types do |t|
      t.string :name

      t.timestamps
    end
    UserType.create name: "Admin"
    UserType.create name: "Supervisor"
    UserType.create name: "Supporter"
  end
end
