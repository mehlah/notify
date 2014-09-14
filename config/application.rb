require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Notify
  class Application < Rails::Application

    config.generators do |generate|
      generate.helper false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end

    config.i18n.default_locale = :fr
    config.i18n.enforce_available_locales = true

    config.time_zone = 'Europe/Paris'
    config.active_record.default_timezone = :utc
  end
end
