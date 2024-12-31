class Child < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true, unless: -> { self.username_changed? }
  validates :parent_id, presence: true

  belongs_to :parent
  has_many :child_chores
  has_many :chores, through: :child_chores

  def monday_chores
    childChores = ChildChore.where(child_id: self.id)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.monday
        chores << chore
      end
    }
    return chores
  end
  def tuesday_chores
    childChores = ChildChore.where(child_id: self.id)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.tuesday
        chores << chore
      end
    }
    return chores
  end
  def wednesday_chores
    childChores = ChildChore.where(child_id: self.id)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.wednesday
        chores << chore
      end
    }
    return chores
  end
  def thursday_chores
    childChores = ChildChore.where(child_id: self.id)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.thursday
        chores << chore
      end
    }
    return chores
  end
  def friday_chores
    childChores = ChildChore.where(child_id: self.id)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.friday
        chores << chore
      end
    }
    return chores
  end
  def saturday_chores
    childChores = ChildChore.where(child_id: self.id)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.saturday
        chores << chore
      end
    }
    return chores
  end
  def sunday_chores
    childChores = ChildChore.where(child_id: self.id)
    chores = []
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.sunday
        chores << chore
      end
    }
    return chores
  end
end
