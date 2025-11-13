# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    external_identifier { 12_345 }
    external_type { 'Tenant' }
  end
end
