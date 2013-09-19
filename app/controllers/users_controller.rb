class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # ActiveRecord::Base.transaction do
    #   @user = User.new(params[:user])
    @user = User.new(params[:user])

    @subscription_plans = params[:subscription].map do |_, sub_id|
      sub_id
    end
    @user.subscription_plan_ids = @subscription_plans.reject! { |id| id.empty? }

    @user.save

    redirect_to user_url(@user)

    # else
    #   render :new
    # end
  end

  def show
    @user = User.find(params[:id])
  end
end
