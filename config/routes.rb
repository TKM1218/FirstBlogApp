Rails.application.routes.draw do
  devise_for :users
  get 'blogapps' => 'blogapps#index'
  get 'sign_up' => 'registrations#new'




  root 'blogapps#index'
end
