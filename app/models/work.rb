class Work < ApplicationRecord
  belongs_to :material
  has_one :user, through: :material

  validates :start, presence: true
  validates :end, presence: true
  validates :status, presence: true

  enum status:{ incomplete: 0, complete: 1 }

end
