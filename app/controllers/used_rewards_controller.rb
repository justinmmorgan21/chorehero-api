class UsedRewardsController < ApplicationController
  def create
    @used_reward = UsedReward.new(
      child_id: params[:child_id],
      reward_id: params[:reward_id],
      date_approved: nil
    )
    if @used_reward.save
      render :show, status: :created
    else
      render json: { errors: @used_reward.errors.full_messages }, status: :bad_request
    end
  end

  def index
    if current_child_user
      @used_rewards = UsedReward.where(child_id: current_child_user)
      render :index
    elsif current_parent_user
      @used_rewards = UsedReward.currentParentUsedRewards(current_parent_user)
      render :index
    end
  end

  def update
    @used_reward = UsedReward.find_by(id: params[:id])
    if @used_reward
      @used_reward.assign_attributes(params.permit(:child_id, :reward_id, :date_approved).compact_blank)
    end
    if @used_reward.save!
      render :show
    else
      render json: { error: @used_reward.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def destroy
    @used_reward = UsedReward.find_by(id: params[:id])
    if @used_reward.destroy()
      @used_rewards = UsedReward.all
      render :index
    else
      render json: { error: @used_reward.errors.full_messages },
      status: :bad_request
    end
  end
end
