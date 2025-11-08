# frozen_string_literal: true

class CreateUsageMeterCustomers < ActiveRecord::Migration[7.0]
  PK_TYPE = begin
    ApplicationRecord.connection_config[:primary_key_type]
  rescue StandardError
    :bigint
  end

  def change
    create_table :usage_meter_customers do |t|
      t.string :external_identifier
      t.string :external_type
      t.string :human_description
      if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
        t.jsonb :metadata
      else
        t.json :metadata
      end

      t.timestamps
    end
    add_index :usage_meter_customers, %i[external_type external_identifier], unique: true
  end
end
