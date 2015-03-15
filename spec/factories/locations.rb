# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    lng "121.56481"
    lat  "25.033718"
    pic { Rack::Test::UploadedFile.new("#{Rails.root}/spec/factories/avatar.jpg") }
    name "101大樓"
    message "打卡訊息假資料"
    user_id 1
  end
end
