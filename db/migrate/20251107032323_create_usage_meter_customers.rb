# frozen_string_literal: true

class CreateUsageMeterCustomers < ActiveRecord::Migration[7.0]
  PK_TYPE = begin
    ApplicationRecord.connection_config[:primary_key_type]
  rescue StandardError
    :bigint
  end

  def change
    create_table :usage_meter_customers do |t|
      if ActiveRecord::Base.connection.adapter_name == 'Mysql2'
        t.string :external_identifier, collation: "utf8mb4_bin"
        t.string :external_type, collation: "utf8mb4_bin"
      else
        t.string :external_identifier
        t.string :external_type
      end
      t.string :human_description
      if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
        t.jsonb :metadata
      else
        t.json :metadata
      end

      t.timestamps
    end
    add_index :usage_meter_customers, %i[external_type external_identifier], unique: true, name: :index_usage_meter_customers_on_external_type_and_identifier
  end
end
