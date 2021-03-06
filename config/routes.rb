Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :bookings, only: [:new, :create] # :edit, :update
  end
  resources :bookings, only: [:edit, :update]  do
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:index]

  resources :users do
    resources :reviews, only:  [:new, :create]
  end

  patch "/bookings/:id/cancel", to: "bookings#cancel", as: 'booking_cancel'
  patch "/bookings/:id/approve", to: "bookings#approve", as: 'booking_approve'
  patch "/bookings/:id/decline", to: "bookings#decline", as: 'booking_decline'

end
