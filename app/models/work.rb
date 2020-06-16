class Work < ApplicationRecord
  belongs_to :material

  validates :start, presence: true
  validates :finish, presence: true
  validates :status, presence: true

  enum status:{ incomplete: 0, complete: 1 }

end
