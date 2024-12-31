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
    puts "************"
    childChores.each { |childChore|
      chore = Chore.find_by(id: childChore.chore_id)
      if chore.monday
        chores << chore
      end
    }
    puts "************"
    pp chores
    puts "************"
  end
end
