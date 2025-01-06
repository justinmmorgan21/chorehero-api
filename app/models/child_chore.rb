class ChildChore < ApplicationRecord
  belongs_to :child
  belongs_to :chore

  def doneWeekly
    chore = Chore.find_by(id: self.chore_id)
    done = true
    if (chore.monday && !self.done_mon  || chore.tuesday && !self.done_tue ||
        chore.wednesday && !self.done_wed || chore.thursday && !self.done_thu ||
        chore.friday && !self.done_fri || chore.saturday && !self.done_sat ||
        chore.sunday && !self.done_sun)
      done = false
    end
    return done
  end
end