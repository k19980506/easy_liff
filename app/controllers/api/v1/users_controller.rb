require "Date"

module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        render json: @users, status: :ok
      end

      def show
        @users = User.find_by(id: params[:id])
        render json: @users, status: :ok
      end

      def line
        @users = User.where(line_id: params[:id])
        render json: @users, status: :ok
      end

      def create
        user_params = params.permit(:line_id, user_details: [:name, :date_of_birth, :gender])

        # session
        @users =
          user_params[:user_details].map do |user|
            {
              name: user[:name],
              date_of_birth: Date.parse(user[:date_of_birth]),
              gender: user[:gender],
              line_id: user_params[:line_id],
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
        params.require(:user).permit(:name, :date_of_birth, :gender)
      end
    end
  end
end
