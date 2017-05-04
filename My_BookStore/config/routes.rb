Rails.application.routes.draw do
  resources :books
  resources :users
  resources :kind_of_books
  resources :purchase_orders
  
  get 'sessions' => 'sessions#create', as: :create

  get 'sessions/destroy'

  root 'pages#home'

  get 'login' => 'sessions#new'

  get 'logout' => 'sessions#destroy'
  get 'about' => 'pages#about', as: :about
  get 'contact' => 'pages#contact', as: :contact
  get 'register' => 'users#new', as: :register
  get 'info' => 'persionals#personal_page'
  get 'kind_of_book/:type', to: "pages#KindOfBook"
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
