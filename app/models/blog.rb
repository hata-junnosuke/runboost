class Blog < ApplicationRecord
  scope :this_month, -> { where(start_time: Time.current.all_month) }
  scope :this_year, -> { where(start_time: Time.current.all_year) }
end
