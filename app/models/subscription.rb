class Subscription < ActiveRecord::Base
  attr_accessible :subscription_plan, :user_id

  validates :subscription_plan, presence: true
  validates :user_id, presence: true

end
