require "Date"

module Api
  module V1
    class UsersController < ApplicationController
      before_action :validate_date_format, only: [:create, :update]

      def index
        @users = User.all
        render json: @users, status: :ok
      end

      def show
        @users = User.find(params[:id])
        render json: @users, status: :ok
      end

      def line
        @users = User.where(line_id: params[:id])
        render json: @users, status: :ok
      end

      def create
        @users =
          user_params[:user_details].map do |user|
            {
              name: user[:name],
              date_of_birth: Date.parse(user[:date_of_birth]),
              gender: user[:gender],
              line_id: user_params[:line_id],
              church_name: user[:church_name],
            }
          end

        if User.create(@users)
          render json: @users, status: :created
        else
          render json: { error: "Failed to create user", details: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        user = User.find(params[:id])

        if user.update(user_params)
          render json: user, status: :ok
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        User.where(line_id: params[:line_id]).destroy_all
        render json: [], status: :no_content
      end

      private

      def user_params
        params.permit(:line_id, :church_id, user_details: [:name, :date_of_birth, :gender, :church_name])
      end

      def validate_date_format
        return if params[:user_details].blank?

        unless params[:user_details].all? { |user| valid_date_format?(user[:date_of_birth]) }
          render json: { error: "Invalid date_of_birth format" }, status: :bad_request
        end
      end

      def valid_date_format?(date_string)
        Date.strptime(date_string, "%Y-%m-%d")
        true
      rescue ArgumentError
        false
      end
    end
  end
end
