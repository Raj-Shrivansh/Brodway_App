Rails.application.routes.draw do
  root 'plays#index'
  resources :play
end
