class ChildChore < ApplicationRecord
  belongs_to :child
  belongs_to :chore
end
