# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Api::V1::ApplicationV1Controller
  skip_before_action :authenticate_user!, only: %i[create]

  def create
    @user = User.new(user_params)
    
    if @user.save
      render json: { user: @user }, status: :ok
    else
      render json: { message: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
