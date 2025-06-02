Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  get "up" => "rails/health#show", :as => :rails_health_check

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :admin do
  end

  ###############
  ###   API  ###
  ###############

  namespace :api do
  end
end
