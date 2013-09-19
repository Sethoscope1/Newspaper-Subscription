class NewspapersController < ApplicationController

  def new
    @newspaper = Newspaper.new
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @newspaper = Newspaper.new(params[:newspaper])

        @subscription_plans = params[:subscription_plans].map do |_, sub_params|
          SubscriptionPlan.new(sub_params)
        end
        @subscription_plans = @subscription_plans.select { |plan| plan[:price] != nil }

        @newspaper.save

        @subscription_plans.each do |subscription_plan|
          subscription_plan.newspaper_id = @newspaper.id
          subscription_plan.save
        end

        raise "invalid" unless @newspaper.valid? && @subscription_plans.all? { |plan| plan.valid? }
      end
    end

    redirect_to newspaper_url(@newspaper)
  end

  def show
    @newspaper = Newspaper.find(params[:id])
  end

  def index

  end
end
