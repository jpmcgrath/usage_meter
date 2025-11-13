# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsageMeter::Customer do
  let(:valid_attributes) { { external_type: 'test_type', external_identifier: 'test_id' } }

  describe 'Validations' do
    let!(:existing_customer) { described_class.create(valid_attributes) }

    it { is_expected.to validate_presence_of(:external_type) }
    it { is_expected.to validate_presence_of(:external_identifier) }
    it { is_expected.to validate_uniqueness_of(:external_identifier).scoped_to(:external_type) }
  end

  describe 'creation and readonly behavior' do
    let(:customer) { described_class.find_by(valid_attributes) }

    it 'allows creation but is readonly and prevents updates after save' do
      expect do
        described_class.create!(valid_attributes)
      end.to change(described_class, :count).by(1)

      expect(customer).to be_present
      expect(customer).to be_persisted
      expect(customer).to be_readonly

      expect do
        customer.update!(human_description: 'new description')
      end.to raise_error(ActiveRecord::ReadOnlyRecord)
    end
  end
end
