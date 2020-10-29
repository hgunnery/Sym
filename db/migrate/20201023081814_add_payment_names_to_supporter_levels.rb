class AddPaymentNamesToSupporterLevels < ActiveRecord::Migration[6.0]
  def change
		add_column :supporter_levels, :stripe_plan_name, :string
		add_column :supporter_levels, :paypal_plan_name, :string
  end
end
