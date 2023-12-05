# frozen_string_literal: true

module Api
  module V1
    class ChurchesController < ApplicationController
      def index
        @churches = Church.all
        render json: @churches.map(&:name), status: :ok
      end
    end
  end
end
