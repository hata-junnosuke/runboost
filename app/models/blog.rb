# frozen_string_literal: true

class Blog < ApplicationRecord
  scope :this_month, -> { where(start_time: Time.current.all_month) }
  scope :this_year, -> { where(start_time: Time.current.all_year) }
  scope :last_month, -> { where(start_time: Time.current.last_month.all_month) }
  scope :two_months_ago, -> { where(start_time: 2.months.ago.all_month) }
  validates :distance,:content, presence: true
end
