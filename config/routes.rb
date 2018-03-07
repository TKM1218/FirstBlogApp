Rails.application.routes.draw do
  devise_for :users
  get 'blogapps' => 'tweets#index'
  #get 'tweets/new' => 'tweets#new'
  #post 'tweets' => 'tweets#create'
  #get 'tweets/:id' => 'tweets#show'
  resources :tweets do
    resources :comments
  end



  root 'tweets#index'
end
