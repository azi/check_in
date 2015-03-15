Rails.application.routes.draw do
  
  #API
  namespace :api do
    namespace :v1 do
      post 'users/add_device' => "users#add_device"
    end
  end
  
end
