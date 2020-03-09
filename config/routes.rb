Rails.application.routes.draw do

  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
} 

devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#new_guest'
end

  root 'tops#index'
  
  resources :restaurants do
    collection do
      get 'search'
    end
    member do
      get 'time'
      get 'image'
      get 'other'
    end
    resources :images, only: [:create, :destroy]
    resources :reservations, only: [:new, :create]
  end

  resources :reviews, only: [:create, :destroy]
  resources :mypages, only: [:index, :show]
  

end