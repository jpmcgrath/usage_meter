# frozen_string_literal: true

module UsageMeter
  class EventType < ApplicationRecord
    KEY_FORMAT = /\A[a-z0-9\-_]+\z/

    validates :key, presence: true
    validates :key, uniqueness: true
    validates :key, format: { with: KEY_FORMAT }

    attr_readonly :key
  end
end
