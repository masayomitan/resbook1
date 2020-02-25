Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
} 

  root 'tops#index'
  
  resources :restaurants do
    member do
      get 'time'
      get 'image'
      get 'other'
    end
    resources :images, only: [:create, :destroy]
    resources :reservations, only: [:new, :create]
  end
  
  resources :reviews
  resources :mypages

end