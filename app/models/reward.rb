class Reward < ApplicationRecord
  belongs_to :parent

  def reward_groups
    rewards = Reward.all
    groups = {}
    rewards.each { |reward|
      if !groups[reward.points_cost] 
        groups[reward.points_cost]= []
      end
      groups[reward.points_cost] << reward
    }
    pp groups
  end
end
