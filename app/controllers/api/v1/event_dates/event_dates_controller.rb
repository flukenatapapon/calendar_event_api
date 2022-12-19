# frozen_string_literal: true

class Api::V1::Events::EventDatesController < Api::V1::ApplicationV1Controller
  # skip_before_action :authenticate_user!, only: %i[show index]
  # before_action :load_event, only: %i[show update destroy]

  # def show
  #   render json: { data: @event }, status: :ok
  # end

  # def update
  #   if @event.update(event_params)
  #     render json: { data: @event }, status: :ok
  #   else
  #     render json: { message: @event.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   if @event.destroy
  #     render json: { message: @event.errors.full_messages }, status: :ok
  #   else
  #     render json: { message: @event.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  # private

  # def load_event

  # def event_time_params
  #   params.require(:event_time).permit(:name, :description, event_dates_attributes: %i[start_date end_date])
  # end
end
