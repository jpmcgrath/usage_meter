# frozen_string_literal: true

module UsageMeter
  # EventType allows strict categorization of events
  #
  # Events of the same category and Customer will
  # tally together for the usage of that type
  # Events must have a type, and types will be
  # enforced with a foreign key ref.
  #
  # Key must be unique, to allow lookup
  class EventType < ApplicationRecord
    KEY_FORMAT = /\A[a-z0-9\-_]+\z/
    def self.key_format
      KEY_FORMAT
    end

    validates :key, presence: true
    validates :key, uniqueness: true
    validates :key, format: { with: key_format, message: :invalid, key_format_regex: key_format.inspect }

    attr_readonly :key
  end
end
