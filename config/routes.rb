Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  root to: 'pages#home'
  devise_for :users
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
