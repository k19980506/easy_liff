# frozen_string_literal: true

require 'Date'

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]
      before_action :set_line_users, only: %i[line_users delete_line_users]
      before_action :validate_date_format, only: %i[create update]

      def index
        @users = User.all
        render json: @users, status: :ok
      end

      def show
        render json: @user, status: :ok
      end

      def create
        @users =
          create_user_params[:user_details].map do |user|
            User.new({
                       name: user[:name],
                       date_of_birth: Date.parse(user[:date_of_birth]),
                       gender: user[:gender],
                       line_id: create_user_params[:line_id],
                       church_name: user[:church_name]
                     })
          end

        begin
          render json: @users, status: :created if @users.all?(&:save)
        rescue e
          render json: { error: 'Failed to create user', details: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @user.update(update_user_params)
          render json: @user, status: :ok
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @user.delete
        render status: :no_content
      end

      def line_users
        render json: @users, status: :ok
      end

      def delete_line_users
        @users.destroy_all
        render status: :no_content
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def set_line_users
        @users = User.where(line_id: params[:id])
      end

      def create_user_params
        params.permit(:line_id, user_details: %i[name date_of_birth gender church_name])
      end

      def update_user_params
        params.require(:user).permit(:line_id, :name, :date_of_birth, :gender, :church_name)
      end

      def validate_date_format
        return if params[:user_details].blank?

        return if params[:user_details].all? { |user| valid_date_format?(user[:date_of_birth]) }

        render json: { error: 'Invalid date_of_birth format' }, status: :bad_request
      end

      def valid_date_format?(date_string)
        Date.strptime(date_string, '%Y-%m-%d')
        true
      rescue ArgumentError
        false
      end
    end
  end
end
