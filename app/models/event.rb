# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  has_many :event_dates, dependent: :destroy

  accepts_nested_attributes_for :event_dates
end
