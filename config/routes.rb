Rails.application.routes.draw do
  devise_for :users
  
  resources :habits

  root to: 'habits#index'
end
