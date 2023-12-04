require "Date"

module Api
  module V1
    class EventsController < ApplicationController
      rescue_from Mongoid::Errors::DocumentNotFound, with: :record_not_found

      before_action :set_event, except: [:index, :create]
      before_action :validate_date_format, only: [:create, :update]

      def index
        @events = Event.all
        render json: @events, status: :ok
      end

      def show
        render json: @event, status: :ok
      end

      def create
        @event = Event.new(event_params)
        if @event.save
          render json: @event, status: :created
        else
          render json: { error: "Failed to create event", details: @event.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @event.update(event_params)
          render json: @event, status: :ok
        else
          render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @event.delete
        render json: [], status: :no_content
      end

      private

      def event_params
        params.require(:event).permit(
          :title,
          :start_date,
          :end_date,
          options: [
            :date,
            status: [
              :breakfast,
              :lunch,
              :dinner,
              :accommodation,
            ],
          ],
        )
      end

      def set_event
        @event = Event.find(params[:id])
      end

      def validate_date_format
        return if params[:options].blank?

        unless valid_date_format?(params[:start_date]) && valid_date_format?(params[:end_date]) && params[:options].all? { |option| valid_date_format?(option[:date]) }
          render json: { error: "Invalid date format" }, status: :bad_request
        end
      end

      def valid_date_format?(date_string)
        Date.strptime(date_string, "%Y-%m-%d")
        true
      rescue ArgumentError
        false
      end

      def record_not_found
        render json: { error: "Record not found" }, status: :not_found
      end
    end
  end
end
