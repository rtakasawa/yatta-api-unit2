class Work < ApplicationRecord
  belongs_to :material, touch: true

  validates :start, presence: true
  validates :finish, presence: true
  validates :do_on, presence: true
  validate :do_on_not_future_date

  def do_on_not_future_date
    errors.add(:do_on, 'は今日以前の日付を選択してください') if do_on.nil? || do_on > Time.zone.today
  end

  scope :current_month, -> { where(do_on: Time.zone.today.beginning_of_month..Time.zone.today.end_of_month) }
  scope :last_month, -> { where(do_on: Time.zone.today.prev_month.beginning_of_month..Time.zone.today.prev_month.end_of_month) }
end
