# frozen_string_literal: true

require 'date'

module Api
  module V1
    class EventsController < ApplicationController
      before_action :set_event, except: %i[index create]

      def index
        @events = Event.all
        render json: EventResource.new(@events), status: :ok
      end

      def show
        render json: EventResource.new(@event), status: :ok
      end

      def create
        @event = Event.new(event_params)

        if @event.save
          render json: EventResource.new(@event), status: :created
        else
          render json: { error: 'Failed to create event', details: @event.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @event.update(event_params)
          render json: EventResource.new(@event), status: :ok
        else
          render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @event.destroy

        head :no_content
      end

      def report
        render json: @event.report.as_json, status: :ok
      end

      private

      def event_params
        params.require(:event).permit(
          :title,
          :start_date,
          :end_date,
          options: [:date, { status: %i[breakfast lunch dinner accommodation] }]
        )
      end

      def set_event
        @event = Event.find(params[:id])
      end
    end
  end
end
