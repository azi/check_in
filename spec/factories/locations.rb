# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
  	association :user
    longitude "121.56481"
    latitude  "25.033718"
    pic { Rack::Test::UploadedFile.new("#{Rails.root}/spec/factories/avatar.jpg") }
    name "101大樓"
    message "打卡訊息假資料"
  
    factory :location_1 do
      longitude "121.560296"
      latitude  "25.039907"
      name "國父記念館"
      message "國父記念館－打卡訊息假資料"
    end  

    factory :location_50 do
      longitude "121.739466"
      latitude  "25.132301"
      name "基隆火車站"
      message "基隆火車站－打卡訊息假資料"
    end  

    factory :location_500 do
      longitude "120.30194"
      latitude  "22.669167"
      name "高雄巨蛋"
      message "高雄巨蛋－打卡訊息假資料"
    end
  end
end
