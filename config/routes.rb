Rails.application.routes.draw do
  root 'books#index' # Points the homepage directly to your books index
  resources :books, only: [:index, :show]
  resources :authors, only: [:index, :show]
  get 'about', to: 'pages#about'
end