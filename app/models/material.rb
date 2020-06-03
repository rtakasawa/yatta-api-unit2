class Material < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :category, presence: true
  validates :path, format: /\A#{URI::regexp(%w(http https))}\z/
  enum category:{ book: 0, video: 1, web: 2, other: 3 }
end