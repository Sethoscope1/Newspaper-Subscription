class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :SubscriptionPlan
      t.decimal :price
      t.boolean :weekly
      t.integer :newspaper_id

      t.timestamps
    end
  end
end
