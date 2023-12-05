Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :events, except: [:new, :edit]
      resources :attendance_records, except: [:new, :edit]

      get "/users/line/:id", to: "users#line", as: "line_users"
      get "/churches", to: "churches#index"
    end
  end
end
