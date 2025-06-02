Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  get "up" => "rails/health#show", :as => :rails_health_check

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :inss, only: %i[index create update delete] do
    get :discount, on: :member
  end

  namespace :public do
    resources :proponents, only: %i[index create]
  end

  ###############
  ###   API  ###
  ###############

  namespace :api do
  end
end
