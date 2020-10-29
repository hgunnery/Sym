class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :supporter_level_id
      t.integer :status, default: 0
      t.string :token
      t.decimal :price, :precision => 6, :scale => 2
      t.integer :payment_gateway
      t.string :customer_id
      t.string :charge_id
      t.string :error_message

      t.timestamps
    end
  end
end
