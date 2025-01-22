class Reward < ApplicationRecord
  belongs_to :parent
  has_many :used_rewards
end
