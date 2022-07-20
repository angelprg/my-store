Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :articles
    resources :subcategories
    resources :categories
    resources :brands
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/admin/dashboard', to: 'admin#dashboard'
  # Defines the root path route ("/")

  root "pages#home"
end
