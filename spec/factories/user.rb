FactoryBot.define do
    factory :user do
      email { FFaker::Internet.unique.email }
      password = FFaker::Internet.unique.password
      password { password }
      password_confirmation { password }
    end
  end