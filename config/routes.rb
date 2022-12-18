# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :users do
        post '/sign_in', to: 'sessions#create'
        delete '/sign_out', to: 'sessions#destroy'
      end

      namespace :events do
        get '', to: 'events#index'
        post '/', to: 'events#create'
        get '/:event_id', to: 'events#show'
        patch '/:event_id', to: 'events#update'
        delete '/:event_id', to: 'events#destroy'
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
