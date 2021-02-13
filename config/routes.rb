Rails.application.routes.draw do
  resources :shops
  root 'shops#index'
  resources :reviews
end
