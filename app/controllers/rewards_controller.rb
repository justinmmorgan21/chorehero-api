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
    @reward_groups = @rewards.group_by(&:points_cost)
    render :index
  end

  def update
    @reward = Reward.find_by(id: params[:id])
    if @reward
      @reward.assign_attributes(params.permit(:parent_id, :title, :points_cost, :active).compact_blank)
      
      if @reward.save
        render json: { message: "#{@reward.title} - #{@reward.points_cost}" }
      else
        render json: { error: @reward.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Reward not found" }, status: :not_found
    end
  end
end
