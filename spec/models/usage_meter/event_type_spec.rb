# frozen_string_literal: true

require 'rails_helper'

module UsageMeter
  RSpec.describe EventType do
    describe 'validations' do
      let!(:existing_record) { described_class.create(key: 'existing_key') }

      it { is_expected.to validate_presence_of(:key) }
      it { is_expected.to validate_uniqueness_of(:key) }

      describe 'key format' do
        it 'is valid with a proper format' do
          valid_keys = %w[valid_key valid-key validkey123 123_valid_key]
          valid_keys.each do |valid_key|
            event_type = described_class.new(key: valid_key)
            expect(event_type).to be_valid, "#{valid_key.inspect} should be valid"
          end
        end

        it 'is invalid with an improper format' do
          invalid_keys = ['invalid key', 'invalid@key!', 'invalid.key', 'invalid/key', 'INVALID_KEY']
          invalid_keys.each do |invalid_key|
            event_type = described_class.new(key: invalid_key)
            expect(event_type).to be_invalid, "#{invalid_key.inspect} should be invalid"
            expect(event_type.errors[:key]).to include('only allows letters, numbers, underscores, and hyphens')
          end
        end
      end
    end
  end
end
