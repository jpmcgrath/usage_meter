require "test_helper"

module UsageMeter
  class CustomerTest < ActiveSupport::TestCase
    test "allows creation but is readonly after save" do
      # creation should be allowed
      assert_difference "UsageMeter::Customer.count", 1 do
        UsageMeter::Customer.create!(external_type: "test_type", external_identifier: "test_id")
      end

      customer = UsageMeter::Customer.find_by(external_type: "test_type", external_identifier: "test_id")
      assert customer.persisted?

      # model defines readonly? to be true once persisted
      assert customer.readonly?

      # attempting to update a persisted record should raise ActiveRecord::ReadOnlyRecord
      assert_raises(ActiveRecord::ReadOnlyRecord) do
        customer.update!(human_description: "new description")
      end
    end
  end
end
