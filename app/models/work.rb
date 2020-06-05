class Work < ApplicationRecord
  belongs_to :material

  validates :start, presence: true
  validates :end, presence: true
  validates :status, presence: true

  enum category:{ incomplete: 0, complete: 1 }

end
