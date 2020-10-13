# frozen_string_literal: true

class Device < ApplicationRecord
  validates :device_name, presence: true
end
