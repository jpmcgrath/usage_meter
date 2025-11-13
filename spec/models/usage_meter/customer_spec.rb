# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsageMeter::Customer do
  let(:valid_attributes) { { external_type: 'test_type', external_identifier: 'test_id' } }
  let(:customer) { described_class.new }

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:external_type) }
    it { is_expected.to validate_presence_of(:external_identifier) }

    it do
      described_class.create(valid_attributes)
      expect(customer).to validate_uniqueness_of(:external_identifier).scoped_to(:external_type)
    end
  end

  describe 'creation and readonly behavior' do
    let(:customer) { described_class.find_by(valid_attributes) }

    it 'is readonly and prevents updates after save' do
      described_class.create!(valid_attributes)
      expect { customer.update!(human_description: 'new description') }.to raise_error(ActiveRecord::ReadOnlyRecord)
    end
  end
end
