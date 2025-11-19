# frozen_string_literal: true

FactoryBot.define do
  factory :event_log do
    publishable_id { 'MyString' }
    customer { nil }
    event_type { nil }
    quantity { 1 }
    extra_data { '' }
    version { 'MyString' }
    aggregate { nil }
  end
end
