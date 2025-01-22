class UsedReward < ApplicationRecord
  belongs_to :reward
  def reward
    Reward.find_by(id: self.reward_id)
  end

  def self.currentParentUsedRewards(current_parent_user)
    used_rewards = []
    current_parent_user.children.each  { |child|
      used_rewards.concat(child.used_rewards)
    }
    used_rewards
  end
end
