class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :newspaper_id, :price, :weekly

  validates :price, presence: true
  validates :weekly, inclusion: { in: [ true, false ] }

  before_save :validate_newspaper_id

  belongs_to(
    :newspaper,
    class_name: "Newspaper",
    foreign_key: :newspaper_id,
    primary_key: :id
  )

  has_many(
    :subscriptions,
    class_name: "Subscription",
    foreign_key: :subscription_plan_id,
    primary_key: :id
  )

  def validate_newspaper_id
    self.newspaper_id != nil
  end

end
