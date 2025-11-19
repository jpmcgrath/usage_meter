# frozen_string_literal: true

module UsageMeter
  # EventLog is used to record an event for a customer
  #
  # Each event has a customer and a type
  # This class/table represents and append only log, so
  # make everything readonly after persistance.
  # Applications can record extra data in the free form
  # json col.
  # Each event will have a quantity, that must be positive.
  # These quantities will be aggregated on customer and
  # type to summarize usage for a period.
  class EventLog < ApplicationRecord
    belongs_to :customer, optional: false
    belongs_to :event_type, optional: false
    # belongs_to :aggregate

    validates :publishable_id, presence: true, uniqueness: true
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :version, presence: true

    attr_readonly :publishable_id, :customer_id, :event_type_id, :created_at, :updated_at

    def readonly?
      persisted?
    end
  end
end
