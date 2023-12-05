# frozen_string_literal: true

require 'Date'

module Api
  module V1
    class AttendanceRecordsController < ApplicationController
      before_action :set_attendance_record, except: %i[index create]
      before_action :validate_date_format, only: %i[create update]

      def index
        @attendance_records = AttendanceRecord.all

        render json: @attendance_records, status: :ok
      end

      def show
        render json: @attendance_record, status: :ok
      end

      def create
        @attendance_record = AttendanceRecord.new(attendance_record_params)

        if @attendance_record.save
          render json: @attendance_record, status: :created
        else
          render json: { error: 'Failed to create attendance record', details: @attendance_record.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @attendance_record.update(attendance_record_params)
          render json: @attendance_record, status: :ok
        else
          render json: { errors: @attendance_record.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @attendance_record.delete
        render status: :no_content
      end

      private

      def attendance_record_params
        params.require(:attendance_record).permit(
          :user_id,
          :event_id,
          attendance_status: [

            :date,

            { status: %i[
              breakfast
              lunch
              dinner
              accommodation
            ] }

          ]
        )
      end

      def set_attendance_record
        @attendance_record = AttendanceRecord.find(params[:id])
      end

      def validate_date_format
        return if params[:attendance_status].blank?

        return if params[:attendance_status].all? { |detail| valid_date_format?(detail[:date]) }

        render json: { error: 'Invalid date format' }, status: :bad_request
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
