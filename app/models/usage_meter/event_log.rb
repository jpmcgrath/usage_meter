module UsageMeter
  class EventLog < ApplicationRecord
    belongs_to :customer
    belongs_to :event_type
    belongs_to :aggregate
  end
end
