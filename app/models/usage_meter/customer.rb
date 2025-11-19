# frozen_string_literal: true

module UsageMeter
  # UsageMeter Customer model
  # A customer in an enttity who's usage is being metered. This is typically a Tenant
  # Organization, or User.
  #
  # UsageMeter tracks it's own customers to ensure consistency and integrity of usage data.
  # Each customer will have a unique composite key of external_type and external_identifier.
  # Usage data is then associated with these customers, with foreign keys referencing the
  # to ensure referential integrity.
  #
  # Once created, records are readonly by design to prevent tampering with historical usage data.
  class Customer < ApplicationRecord
    has_many :event_logs, class_name: 'UsageMeter::Customer', inverse_of: :customer, dependent: nil

    validates :external_type, presence: true
    validates :external_identifier, presence: true, uniqueness: { scope: :external_type }

    attr_readonly :external_type, :external_identifier, :created_at, :updated_at

    def readonly?
      persisted?
    end
  end
end
