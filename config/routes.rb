Rails.application.routes.draw do
  
  #API
  namespace :api do
    namespace :v1 do
      post 'users/add_device' => "users#add_device"
      resources :locations, :only => [:create, :update, :destroy] do
        collection do
          get 'search'
        end
      end
    end
  end
  
end
