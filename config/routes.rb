Rails.application.routes.draw do
  root to: 'children#index'

  resources :children do
    resources :notes, except: [:index, :show]
  end

  resources :employees, except: [:show]
end
