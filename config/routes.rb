Rails.application.routes.draw do
  root 'users#index'

  # SEO files
  get 'sitemap' => 'statements#sitemap'

  # Routes
  get 'updating', to: 'users#update', as: :updating
  get 'statements', to: 'statements#index', as: :statements
  post 'update', to: 'statements#update'
  get '/:number', to: 'users#show', as: :user

  namespace :api do
    get 'statements.search', to: 'statements#search'
    get 'statements.statistics', to: 'statements#statistics'
    get 'statements.status', to: 'statements#status'

    get 'users.search', to: 'users#search'
  end
end
