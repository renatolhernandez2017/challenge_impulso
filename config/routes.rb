Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  get "up" => "rails/health#show", :as => :rails_health_check

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :inss

  namespace :public do
    resources :proponents, only: %i[index create]
  end

  ###############
  ###   API  ###
  ###############

  namespace :api do
    resources :inss, only: %i[index] do
      get :discount, on: :collection
    end
  end
end
