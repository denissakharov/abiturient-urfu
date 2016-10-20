require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UrfuApplicantsRaiting
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end
    # config.react.server_renderer_pool_size  ||= 1
    # config.react.server_renderer_timeout    ||= 20
    # config.react.server_renderer = React::ServerRendering::SprocketsRenderer
    # config.react.server_renderer_options = {
    #   files: ['react-server.js', 'components.js']
    # }
  end
end
