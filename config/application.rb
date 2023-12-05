# frozen_string_literal: true

require_relative 'boot'

require 'rails'
begin
  require 'action_controller/railtie'
rescue StandardError
  LoadError
end
begin
  require 'action_view/railtie'
rescue StandardError
  LoadError
end
begin
  require 'action_mailer/railtie'
rescue StandardError
  LoadError
end
begin
  require 'active_job/railtie'
rescue StandardError
  LoadError
end
begin
  require 'action_cable/engine'
rescue StandardError
  LoadError
end
begin
  require 'rails/test_unit/railtie'
rescue StandardError
  LoadError
end

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
