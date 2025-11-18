require 'rails_helper'

module UsageMeter
  RSpec.describe EventLog do

    describe 'associations' do
      it { is_expected.to belong_to(:customer).class_name('Customer') }
      it { is_expected.to belong_to(:event_type).class_name('EventType') }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:quantity) }
      it { is_expected.to validate_numericality_of(:quantity).only_integer.is_greater_than(0) }
      it { is_expected.to validate_presence_of(:customer) }
      it { is_expected.to validate_presence_of(:event_type) }
    end
  end
end
