FactoryBot.define do
  factory :blog do
    # association :user
    id { 1 }
    user_id { 1 }
    content { 'ジョグ' }
    distance { 10 }
    start_time { '2021-09-24' }
    comment { 'お疲れ様でした' }
  end
end
