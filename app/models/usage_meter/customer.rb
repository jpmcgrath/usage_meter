# frozen_string_literal: true

module UsageMeter
  class Customer < ApplicationRecord
    validates :external_type, presence: true
    validates :external_identifier, presence: true, uniqueness: { scope: :external_type }

    attr_readonly :external_type, :external_identifier, :created_at, :updated_at

    def readonly?
      persisted?
    end
  end
end
