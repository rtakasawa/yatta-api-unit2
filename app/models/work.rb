class Work < ApplicationRecord
  belongs_to :material, touch: true

  validates :start, presence: true
  validates :finish, presence: true
  validates :do_on, presence: true
  validate :do_on_not_future_date

  def do_on_not_future_date
      errors.add(:do_on, "は今日以前の日付を選択してください") if do_on.nil? || do_on > Date.today
  end

  # 今月
  scope :current_month, -> { where(do_on: Date.today.beginning_of_month..Date.today.end_of_month) }
  # 先月
  scope :last_month, -> { where(do_on: Date.today.prev_month.beginning_of_month..Date.today.prev_month.end_of_month) }
end