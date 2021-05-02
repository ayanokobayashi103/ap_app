Rails.application.routes.draw do
  root 'shops#index'

  controller :owners do
    devise_for :owners, controllers: {
      sessions: 'owners/sessions',
      passwords: 'owners/passwords',
      registrations: 'owners/registrations'
    }
    devise_scope :owner do
      post 'owners/guest_sign_in', to: 'owners/sessions#guest_sign_in'
    end
    resources :owners
  end

  controller :users do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
    }
    devise_scope :user do
      post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    end
    resources :users, only: [:show] do
      collection do
        get 'review'
      end
    end
  end

  resources :shops do
    resources :reviews
  end

  resources :reviews do
    resources :comments
  end

  resources :relationships, only: %i[create destroy]
  resources :blacklists

  controller :guides do
    get :review_poricy, to: 'guides#review_poricy'
    get :guideline, to: 'guidse#guideline'
  end
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
