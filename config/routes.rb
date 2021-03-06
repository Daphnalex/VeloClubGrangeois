Rails.application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  resources :users, except: [:create]
  resources :album_attachments do
    
  end

  resources :galleries, as: :authenticated_root
  mount Ckeditor::Engine => '/ckeditor'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :exits, path: "sorties", path_names: {new: "creer", edit: "modifier"}
  resources :clubs
  resources :reports, except: :index
  resources :stocks
  resources :contacts, only: [:new, :create]
  resources :pictures, except: :destroy
  authenticated :user do
    resources :albums do
      member do
        post 'download'
      end
    end
  end
  resources :mentions, only: [:index]
  resources :presentations, only: [:create, :edit, :update]
end
