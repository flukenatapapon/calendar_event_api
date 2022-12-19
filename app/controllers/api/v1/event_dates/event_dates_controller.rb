# frozen_string_literal: true

class Api::V1::Events::EventDatesController < Api::V1::ApplicationV1Controller
  def create
    @event_time = EventTime.new(event_date_params)

    if @event_time.save
      render json: { data: @event_time }, status: :ok
    else
      render json: { message: @event_time.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def event_date_params
    params.require(:event_date).permit(:start_date, :end_date)
  end
end
