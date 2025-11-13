# frozen_string_literal: true

require 'rails_helper'

module UsageMeter
  RSpec.describe EventType do
    let(:event_type) { described_class.new }

    describe 'validations' do
      it { is_expected.to validate_presence_of(:key) }

      it do
        described_class.create(key: 'existing_key')
        expect(event_type).to validate_uniqueness_of(:key)
      end

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
          end
        end

        it 'errors with an error mesage' do
          event_type = described_class.new(key: 'invalid key')
          event_type.valid?
          expect(event_type.errors[:key]).to include('must satisfy the regular expression /\\A[a-z0-9\\-_]+\\z/')
        end
      end
    end
  end
end
