require_relative 'boot'

require 'faker'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Faker::Config.locale = 'pt-BR'

module Om30Citizen
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
	config.load_defaults 6.0
	
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
	# the framework and any gems in your application.
	
	# config.i18n.default_locale = "pt-BR"
	# Sets the locale to "Simplified Chinese":
	Faker::Config.locale = 'pt-BR'

  end
end
