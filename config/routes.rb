Rails.application.routes.draw do
  resources :shops
  root 'shops#index'
  resources :reviews
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
