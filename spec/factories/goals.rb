FactoryBot.define do
  factory :goal do
    id { 1 }
    user_id { 1 }
    distance { 100 }
    date {"2021-09"}
  end
end
