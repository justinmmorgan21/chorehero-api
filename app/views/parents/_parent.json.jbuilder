json.id parent.id
json.username parent.username
json.email parent.email
json.children parent.children do |child|
  json.id child.id
  json.parent_id child.parent_id
  json.name child.name
  json.username child.username
  json.birthdate child.birthdate
  json.age child.age
  json.points_available child.points_available
  json.money_banked child.money_banked
  json.chores child.chores
  json.child_chores child.child_chores
  json.monday_chores child.monday_chores
  json.tuesday_chores child.tuesday_chores
  json.wednesday_chores child.wednesday_chores
  json.thursday_chores child.thursday_chores
  json.friday_chores child.friday_chores
  json.saturday_chores child.saturday_chores
  json.sunday_chores child.sunday_chores
  json.chores_done_weekly child.chores_done_weekly
  json.active_chores child.active_chores do |chore|
    json.id chore.id
    json.parent_id chore.parent_id
    json.title chore.title
    json.description chore.description
    json.monday chore.monday
    json.tuesday chore.tuesday
    json.wednesday chore.wednesday
    json.thursday chore.thursday
    json.friday chore.friday
    json.saturday chore.saturday
    json.sunday chore.sunday
    json.one_timer chore.one_timer
    json.points_awarded chore.points_awarded
    json.children chore.children
    json.child_chores chore.child_chores
  end
  json.inactive_chores child.inactive_chores
  json.used_rewards child.used_rewards do |used_reward|
    json.id used_reward.id
    json.child_id used_reward.child_id
    json.reward_id used_reward.reward_id
    json.date_approved used_reward.date_approved
    json.reward used_reward.reward
  end
end
json.rewards parent.rewards