class Subscription < ActiveRecord::Base
  attr_accessible :subscription_plan_id, :user_id

  validates :subscription_plan_id, presence: true
  validates :user_id, presence: true

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :subscription_plan,
    class_name: "SubscriptionPlan",
    foreign_key: :subscription_plan_id,
    primary_key: :id
  )

end
