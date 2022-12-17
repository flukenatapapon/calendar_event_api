# frozen_string_literal: true

class Api::V1::ApplicationV1Controller < ApplicationController
  before_action :authenticate_user!

  def render_unautorize
    render json: { message: 'pleased sign in' }, status: :unauthorized
  end

  def render_nil_header
    render json: { message: 'no header found' }, status: :unprocessable_entity
  end

  def render_jwt_error
    render json: { message: 'error jwt token' }, status: :bad_request
  end

  protected

  def set_current_user_from_header
    auth_header = request.headers['Authorization']
    jwt = auth_header&.split(' ')&.last
    return render_unautorize unless jwt.present? || auth_header.present?

    begin
      results = JWT&.decode jwt, ENV['secret_key'], true, { algorithm: 'HS256' }
    rescue StandardError
      return render_jwt_error
    end

    payload = results.first
    return render_unautorize if payload.blank?

    @current_user = User.find_by(auth_token: payload['auth_token'])
    return render_unautorize if @current_user.blank?
  end

  def authenticate_user!
    set_current_user_from_header

    @current_user
  end
end
