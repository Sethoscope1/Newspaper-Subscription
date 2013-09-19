class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.decimal :price
      t.boolean :weekly
      t.integer :newspaper_id

      t.timestamps
    end
  end
end
