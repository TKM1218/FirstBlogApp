Rails.application.routes.draw do
  devise_for :users
  get 'blogapps' => 'tweets#index'
  #get 'tweets/new' => 'tweets#new'
  #post 'tweets' => 'tweets#create'
  #get 'tweets/:id' => 'tweets#show'
  resources :tweets do
    resources :comments
    resources :likes, only: [:create, :destroy]
    #resources :tags

    #post :tag, on: :user
    #delete :tag, on: :user
  end
  #get 'tweets/:id/likes.id' => 'tweets#like'
  get 'tweets/:id/destroy' => 'tweets#destroy'
  #resources :tag, only: [:index, :show]
  resources :users





  root 'tweets#index'
end
