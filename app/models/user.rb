class User < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many(
    :subscriptions,
    class_name: "Subscription",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :subscription_plans, through: :subscriptions, source: :subscription_plan

end
