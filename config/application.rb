# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
require 'active_job/railtie'
require 'action_cable/engine'
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module EasyLiff
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w[assets tasks])
    config.generators.orm :mongoid
    config.autoloader = :classic
    config.action_controller.allow_forgery_protection = false
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => 'GET, PATCH, PUT, POST, OPTIONS, DELETE',
      'Access-Control-Allow-Headers:' => 'Origin, X-Requested-With, Content-Type, Accept'
    }
  end
end
