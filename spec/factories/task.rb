FactoryBot.define do
    factory :task do
      title { FFaker::NameBR.unique.name }
      description { FFaker::Lorem.unique.phrase }
      deadline { Date.today }
      trait :with_user do
        user_id { create(:user).id }
      end
      trait :to_do do
        status { 0 }
      end
      trait :done do
        status { 1 }
      end
    end
  end