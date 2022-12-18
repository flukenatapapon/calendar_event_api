# frozen_string_literal: true

class Api::V1::Events::EventsController < Api::V1::ApplicationV1Controller
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :load_event, only: %i[show update destroy]

  def index
    @events = Event.all

    render json: { data: @events }, status: :ok
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: { data: @event }, status: :ok
    else
      render json: { message: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: { data: @event }, status: :ok
  end

  def update
    if @event.update(event_params)
      render json: { data: @event }, status: :ok
    else
      render json: { message: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.destroy
      render json: { message: @event.errors.full_messages }, status: :ok
    else
      render json: { message: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def event_params
    params.require(:event).permit(:name, :description)
  end
end
