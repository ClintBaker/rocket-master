Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :product_orders, except: [:edit, :show, :update]
  resources :products

  get 'signup', to: 'users#new'
  get 'vendors', to: 'users#vendors'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
