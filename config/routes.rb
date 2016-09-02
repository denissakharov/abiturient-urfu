Rails.application.routes.draw do
  root 'users#index'

  # SEO files
  get 'sitemap' => 'statements#sitemap'

  # Routes
  get 'updating', to: 'users#update', as: :updating
  get 'statements', to: 'statements#index', as: :statements
  post 'update', to: 'statements#update'
  get '/:number', to: 'users#show', as: :user
end
