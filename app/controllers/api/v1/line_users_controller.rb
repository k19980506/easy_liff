# frozen_string_literal: true

require 'date'

module Api
  module V1
    class LineUsersController < ApplicationController
      before_action :set_line_users, only: %i[show destroy]
      before_action :validate_date_format, only: %i[create]

      def show
        render json: @line_users, status: :ok
      end

      def create
        @line_users =
          line_users_params[:user_details].map do |user|
            User.new({
                       name: user[:name],
                       date_of_birth: Date.parse(user[:date_of_birth]),
                       gender: user[:gender],
                       line_id: line_users_params[:line_id],
                       church_name: user[:church_name]
                     })
          end

        render json: @line_users, status: :created if @line_users.all?(&:save)
      end

      def destroy
        user_ids = @line_users.map(&:id)
        AttendanceRecord.where('user_id' => { '$in' => user_ids }).destroy_all
        @line_users.destroy_all

        head :no_content
      end

      private

      def set_line_users
        @line_users = User.where(line_id: params[:id])
      end

      def line_users_params
        params.permit(:line_id, user_details: %i[name date_of_birth gender church_name])
      end

      def validate_date_format
        raise Errors::BadRequest if params[:user_details].blank?

        params[:user_details].each { |user| parse_date(user[:date_of_birth]) }
      end

      def parse_date(date_string)
        Date.strptime(date_string, '%Y-%m-%d')
      rescue ArgumentError
        raise Errors::BadRequest
      end
    end
  end
end
