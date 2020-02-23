Rails.application.routes.draw do

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
  end

  resources :mypages

end