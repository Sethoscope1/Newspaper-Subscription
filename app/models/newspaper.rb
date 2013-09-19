class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title

  validates :editor, presence: true
  validates :title, presence: true

  has_many(
    :subscription_plans,
    class_name: "SubscriptionPlan",
    foreign_key: :newspaper_id,
    primary_key: :id
  )

end
