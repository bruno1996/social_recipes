Rails.application.routes.draw do
  root 'home#index'
  resources :recipes, only:[:new,:create,:show]
  resources :kitchens, only:[:new,:create,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
