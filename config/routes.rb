Rails.application.routes.draw do
  devise_for :users
  get 'blogapps' => 'blogapps#index'
  get 'tweets/new' => 'tweets#new'




  root 'blogapps#index'
end
