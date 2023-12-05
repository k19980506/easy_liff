# frozen_string_literal: true

module Errors
  EXCEPTIONS = {
    'StandardError' => { status: :internal_server_error, error_code: '500-00', name: 'InternalServerError' },
    'BadRequest' => { status: :bad_request, error_code: '400-00', name: 'BadRequest' },
    'DocumentNotFound' => { status: :not_found, error_code: '404-00', name: 'DocumentNotFound' }
  }.freeze

  class BaseError < StandardError
    def initialize(msg = nil)
      super
      @message = msg
    end

    def message
      @message || nil
    end
  end

  module Handler
    def self.included(klass)
      klass.class_eval do
        EXCEPTIONS.each do |exception_name, context|
          rescue_from Errors.create_handler(exception_name) do |exception|
            render_json(context, exception)
          end
        end
      end
    end

    private

    def render_json(context, exception)
      logger.error exception.message
      raise if Rails.env.development? && context[:status] == :internal_server_error

      render status: context[:status], json: { code: context[:error_code], name: context[:name] }.compact
    end
  end

  def self.create_handler(exception_name)
    unless const_defined?(exception_name)
      const_set(exception_name, Class.new(BaseError))
      return "Mongoid::Errors::#{exception_name}"
    end
    exception_name
  end
end
