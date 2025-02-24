FactoryBot.define do
  factory :user do
    # Using Faker for generating a unique email address. 
    # Make sure to add the 'faker' gem to your Gemfile if you haven't already.
    email { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
    
    # If Devise confirmable is enabled, the confirmed_at field should be set
    confirmed_at { Time.current }
  end
end