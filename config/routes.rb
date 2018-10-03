Rails.application.routes.draw do
  resources :galleries
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :exits
  resources :clubs
  resources :reports, except: :index
  resources :stocks
  resources :contacts, only: [:new, :create]
  resources :pictures, except: :destroy
  resources :albums
end
