require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Playon
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.x.openweathermap.api_key = 'ba68e2c43979c6eabbd33ff8e32c0611'
    config.x.openweathermap.url = 'api.openweathermap.org/data/2.5/forecast/daily'
  end
end
