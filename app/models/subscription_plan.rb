class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :newspaper_id, :price, :weekly

  validates :price, presence: true
  validates :weekly, inclusion: { in: [ true, false ] }

  belongs_to(
    :newspaper,
    class_name: "Newspaper",
    foreign_key: :newspaper_id,
    primary_key: :id
  )

end
