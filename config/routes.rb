# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :users, except: %i[new edit]
      resources :events, except: %i[new edit]
      resources :attendance_records, except: %i[new edit]
      resources :line_users, only: %i[create show destroy]

      get '/churches', to: 'churches#index'
    end
  end
end
