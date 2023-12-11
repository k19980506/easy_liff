# frozen_string_literal: true

require 'date'

module Api
  module V1
    class AttendanceRecordsController < ApplicationController
      before_action :set_attendance_record, except: %i[index create]
      before_action :validate_date_format, only: %i[create update]

      def index
        @attendance_records = AttendanceRecord.all

        render json: AttendanceRecordResource.new(@attendance_records), status: :ok
      end

      def show
        render json: AttendanceRecordResource.new(@attendance_record), status: :ok
      end

      def create
        @attendance_records =
          create_attendance_record_params.map do |attendance_record|
            user = User.find(attendance_record[:user_id])
            event = Event.find(attendance_record[:event_id])
            attendance_record.merge!({ user:, event: })

            AttendanceRecord.new(attendance_record)
          end

        if @attendance_records.all?(&:save)
          render json: AttendanceRecordResource.new(@attendance_records), status: :created
        else
          render json: { error: 'Failed to create attendance records' }, status: :unprocessable_entity
        end
      end

      def update
        if @attendance_record.update(update_attendance_record_params)
          render json: AttendanceRecordResource.new(@attendance_record), status: :ok
        else
          render json: { errors: @attendance_record.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @attendance_record.delete
        head :no_content
      end

      private

      def create_attendance_record_params
        params.require(:_json).map do |param|
          param.permit(
            :user_id,
            :event_id,
            :attendance,
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
      end

      def update_attendance_record_params
        params.require(:attendance_record).permit(
          :user_id,
          :event_id,
          :attendance,
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

        params[:attendance_status].each { |detail| valid_date_format?(detail[:date]) }
      end

      def valid_date_format?(date_string)
        Date.strptime(date_string, '%Y-%m-%d')
      rescue ArgumentError
        raise Errors::BadRequest
      end
    end
  end
end
