json.rewards @rewards do |reward|
  json.id reward.id
  json.parent_id reward.parent_id
  json.title reward.title
  json.points_cost reward.points_cost
  json.active reward.active
  json.kid_requested reward.kid_requested
end

json.reward_groups @reward_groups
