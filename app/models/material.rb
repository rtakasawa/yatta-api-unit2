class Material < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :works, dependent: :destroy
  validates :title, presence: true
  validates :category, presence: true
  validates :status, presence: true
  # allow_blank: true:入力がブランク時はバリデーションをスキップ
  validates :path, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/, allow_blank: true

  enum category: { book: 0, video: 1, web: 2, other: 3 }
  enum status: { learning: 0, complete: 1 }
end
