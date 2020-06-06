Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :bookings, only: [:new, :create] # :edit, :update
  end
  resources :bookings, only: [:show, :edit, :update]  do
    resources :reviews, only: [:new, :create]
  end

  resources :users do
    resources :bookings, only: [:index]
  end

  patch "/bookings/:id/cancel", to: "bookings#cancel"

end
