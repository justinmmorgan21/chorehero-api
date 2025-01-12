class RewardsController < ApplicationController
  def create
    @reward = Reward.new(
      parent_id: current_parent_user.id,
      title: params[:title],
      points_cost: params[:points_cost],
      active: true,
      kid_requested: params[:kid_requested]
    )
    if @reward.save
      render :show, status: :created
    else
      render json: { errors: @reward.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @rewards = Reward.all
    render :index
  end

  def test
    reward = Reward.find(1)
    reward.reward_groups
  end
end
