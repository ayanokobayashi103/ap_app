Rails.application.routes.draw do
  devise_for :owners, controllers: {
    sessions: 'owners/sessions',
    passwords: 'owners/passwords',
    registrations: 'owners/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root 'shops#index'

  resources :users, only: [:show] do
    collection do
      get 'review'
    end
  end

  resources :shops do
    resources :reviews
  end

  resources :reviews do
    resources :comments
  end

  resources :owners
  resources :relationships, only: %i[create destroy]
  resources :blacklists

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
