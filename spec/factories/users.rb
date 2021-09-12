# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { "runtaro"} 
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "hatahata" }
  end
end