require_relative "boot"

require "rails"
require "action_controller/railtie" rescue LoadError
require "action_view/railtie" rescue LoadError
require "action_mailer/railtie" rescue LoadError
require "active_job/railtie" rescue LoadError
require "action_cable/engine" rescue LoadError
require "rails/test_unit/railtie" rescue LoadError

Bundler.require(*Rails.groups)

module EasyLiff
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
    config.generators.orm :mongoid
    config.autoloader = :classic
    config.action_controller.allow_forgery_protection = false
    config.action_dispatch.default_headers = {
      "Access-Control-Allow-Origin" => "*",
      "Access-Control-Request-Method" => "GET, PATCH, PUT, POST, OPTIONS, DELETE",
      "Access-Control-Allow-Headers:" => "Origin, X-Requested-With, Content-Type, Accept",
    }
  end
end
