Amua::Application.routes.draw do
  root to: 'users#index'

  get 'users/login'
  get 'users/register'
  get 'id:id' => 'users#show', as: 'show_user'
  get 'search' => 'engine#search', as: 'search'
  # get '/users/:id' => redirect('/')

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users
  resources :posts
  resources :comments

  resources :posts, :comments, only: [] do
    member do
      match :like, via: [:get, :post]
      match :unlike, via: [:get, :post]
    end
  end
end
