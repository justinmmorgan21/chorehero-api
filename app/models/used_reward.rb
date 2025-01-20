class UsedReward < ApplicationRecord
  def reward
    Reward.find_by(id: self.reward_id)
  end
end
