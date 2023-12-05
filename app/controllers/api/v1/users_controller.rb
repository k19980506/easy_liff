# frozen_string_literal: true

require 'Date'

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      def index
        @users = User.all
        render json: @users, status: :ok
      end

      def show
        render json: @user, status: :ok
      end

      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: { error: 'Failed to create user', details: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: @user, status: :ok
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @user.delete
        render status: :no_content
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:line_id, :name, :date_of_birth, :gender, :church_name)
      end
    end
  end
end
