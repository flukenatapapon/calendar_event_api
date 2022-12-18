# frozen_string_literal: true

class Event < ApplicationRecord
  belong_to :user
end
