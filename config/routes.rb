Rails.application.routes.draw do
  root 'users#index'
  get 'statements', to: 'statements#index', as: :statements
  get 'update', to: 'statements#update'
  get '/:number', to: 'users#show', as: :user
end
