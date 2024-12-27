class Child < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :parent_id, presence: true

  belongs_to :parent
end
