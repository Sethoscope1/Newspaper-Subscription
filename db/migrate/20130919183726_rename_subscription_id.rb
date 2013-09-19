class RenameSubscriptionId < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :subscription_plan, :subscription_plan_id
  end
end
