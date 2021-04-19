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

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_scope :owner do
    post 'owners/guest_sign_in', to: 'owners/sessions#guest_sign_in'
  end

  resources :users, only: [:show] do
    collection do
      get 'review'
    end
  end

  resources :shops do
    resources :reviews, shallow: true
  end

  resources :reviews do
    resources :comments
  end

  resources :owners
  resources :relationships, only: %i[create destroy]
  resources :blacklists

  get :review_poricy, to: 'guides#review_poricy'
  get :guideline, to: 'guidse#guideline'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
