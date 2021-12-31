class Goal < ApplicationRecord
  # belongs_to :user, dependent: :destroy

  validates :distance, presence: true

  scope :this_month, -> { where(date: Time.current.all_month) }
  scope :last_month, -> { where(date: Time.current.last_month.all_month) }
  scope :two_months_ago, -> { where(date: 2.months.ago.all_month) }
end
