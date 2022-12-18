# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable

  before_create :generate_auth_token

  has_many :events, dependent: :destroy

  def jwt(exp = 15.days.from_now)
    JWT.encode({ auth_token: auth_token, exp: exp.to_i }, ENV['secret_key'], 'HS256')
  end

  def generate_auth_token
    self.auth_token = SecureRandom.uuid
  end

  def jwt_json
    {
      'jwt': jwt,
      'email': email
    }
  end
end
