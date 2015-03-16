# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
  	association :user
    lng "121.56481"
    lat  "25.033718"
    pic { Rack::Test::UploadedFile.new("#{Rails.root}/spec/factories/avatar.jpg") }
    name "101大樓"
    message "打卡訊息假資料"
  end

  factory :location_1 do
  	association :user
    lng "121.560296"
    lat  "25.039907"
    pic { Rack::Test::UploadedFile.new("#{Rails.root}/spec/factories/avatar.jpg") }
    name "國父記念館"
    message "國父記念館－打卡訊息假資料"
  end

  factory :location_50 do
  	association :user
    lng "121.739466"
    lat  "25.132301"
    pic { Rack::Test::UploadedFile.new("#{Rails.root}/spec/factories/avatar.jpg") }
    name "基隆火車站"
    message "基隆火車站－打卡訊息假資料"
  end

  factory :location_500 do
  	association :user
    lng "120.30194"
    lat  "22.669167"
    pic { Rack::Test::UploadedFile.new("#{Rails.root}/spec/factories/avatar.jpg") }
    name "高雄巨蛋"
    message "高雄巨蛋－打卡訊息假資料"
  end
end