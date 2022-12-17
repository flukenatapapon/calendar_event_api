# frozen_string_literal: true

class Api::V1::Users::SessionsController < Api::V1::ApplicationV1Controller
  skip_before_action :authenticate_user!, only: %i[create]

  def create
    @user = User.find_by(email: user_params[:email])

    if @user.present? && @user.valid_password?(user_params[:password])
      render json: { user: @user.jwt_json }, status: :ok
    else
      render json: { message: 'wrong password or email' }, status: :unauthorized
    end
  end

  def destroy
    @current_user.generate_auth_token
    if @current_user.save
      render json: { message: 'successfully sign out' }, status: :ok
    else
      render json: { error: @current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
