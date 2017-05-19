Rails.application.routes.draw do
  resources :tests
  resources :trans
  resources :titles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'titles#index'
end
