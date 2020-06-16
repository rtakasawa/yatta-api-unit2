class Material < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :category, presence: true

  enum category:{ book: 0, video: 1, web: 2, other: 3 }
end