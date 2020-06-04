Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets
  resources :bookings, only: [:new, :create, :edit, :update]

  resources :bookings, only: [:new, :create]  do
    resources :reviews, only: [:new, :create]
  end

  patch "/booking/:id/cancel", to: "bookings#cancel"

end
