module UsageMeter
  class EventLog < ApplicationRecord
    belongs_to :customer
    belongs_to :event_type
    # belongs_to :aggregate

    validates :publishable_id, presence: true, uniqueness: true
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :version, presence: true
    validates :event_type, presence: true
    validates :customer, presence: true

    attr_readonly :publishable_id, :customer_id, :event_type_id, :created_at, :updated_at

    def readonly?
      persisted?
    end
  end
end
