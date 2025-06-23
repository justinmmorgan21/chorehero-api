class Child < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true, unless: -> { self.username_changed? }
  validates :parent_id, presence: true

  belongs_to :parent
  has_many :child_chores
  has_many :chores, through: :child_chores
  has_many :used_rewards

  def age
    birthdate = self.birthdate
    today = Time.now
    child_age = today.year - birthdate.year
    if birthdate.month > today.month || (birthdate.month == today.month && birthdate.day > today.day)
      child_age -= 1
    end
    return child_age
  end

  def monday_chores
    childChores = ChildChore.where(child_id: self.id, active: true)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.monday
        chores << chore
      end
    }
    return chores.sort_by(&:title)
  end
  def tuesday_chores
    childChores = ChildChore.where(child_id: self.id, active: true)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.tuesday
        chores << chore
      end
    }
    return chores.sort_by(&:title)
  end
  def wednesday_chores
    childChores = ChildChore.where(child_id: self.id, active: true)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.wednesday
        chores << chore
      end
    }
    return chores.sort_by(&:title)
  end
  def thursday_chores
    childChores = ChildChore.where(child_id: self.id, active: true)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.thursday
        chores << chore
      end
    }
    return chores.sort_by(&:title)
  end
  def friday_chores
    childChores = ChildChore.where(child_id: self.id, active: true)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.friday
        chores << chore
      end
    }
    return chores.sort_by(&:title)
  end
  def saturday_chores
    childChores = ChildChore.where(child_id: self.id, active: true)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.saturday
        chores << chore
      end
    }
    return chores.sort_by(&:title)
  end
  def sunday_chores
    childChores = ChildChore.where(child_id: self.id, active: true)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.sunday
        chores << chore
      end
    }
    return chores.sort_by(&:title)
  end

  def chores_done_weekly
    childChores = ChildChore.where(child_id: self.id, active: true)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if childChore.done_weekly
        chores << chore
      end
    }
    return chores.sort_by(&:title)
  end

  def active_chores
    childChores = ChildChore.where(child_id: self.id, active: true)
    chores = []
    childChores.each { |childChore|
      chores << Chore.find_by(id: childChore.chore_id)
    }
    return chores.sort_by(&:title)
  end
  def inactive_chores
    childChores = ChildChore.where(child_id: self.id, active: false)
    chores = []
    childChores.each { |childChore|
      chores << Chore.find_by(id: childChore.chore_id)
    }
    return chores.sort_by(&:title)
  end
end
