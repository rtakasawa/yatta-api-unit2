class Work < ApplicationRecord
  belongs_to :material, touch: true

  validates :start, presence: true
  validates :finish, presence: true
  validates :do_on, presence: true
  validates :status, presence: true
  validate :do_on_not_future_date

  enum status: { learning: 0, complete: 1 }

  def do_on_not_future_date
    errors.add(:do_on, 'は今日以前の日付を選択してください') if do_on.nil? || do_on > Time.zone.today
  end

  now = Time.zone.today
  # 当月
  scope :current_month, -> { where(do_on: now.beginning_of_month..now.end_of_month) }
  # 先月
  scope :last_month, -> { where(do_on: now.prev_month.beginning_of_month..now.prev_month.end_of_month) }
end
