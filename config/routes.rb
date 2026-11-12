Rails.application.routes.draw do
  # Define the root path ("/")
  root 'books#index'

  # Routes for Books (index and show)
  resources :books, only: [:index, :show]

  # Routes for Authors (index and show)
  resources :authors, only: [:index, :show]

  # Route for the About page containing the ERD diagram and statistics
  get 'about', to: 'about#index'
end