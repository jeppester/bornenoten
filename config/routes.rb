Rails.application.routes.draw do
  root to: 'children#index'

  resources :children
end
