# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    sequence(:nickname) { |n| "nickname_#{n}"}
    avatar { Rack::Test::UploadedFile.new("#{Rails.root}/spec/factories/avatar.jpg") }
    sequence(:device_token) { |n| "55#{n}e8400-e2#{n}b-41d4-a716-44#{n}655440000"}
    device_os ["iOS", "Android"].sample
    sequence(:device_os_version) { |n| "#{n}.#{n}.#{n}"}
  end

end
