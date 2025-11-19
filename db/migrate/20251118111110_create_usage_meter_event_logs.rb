class CreateUsageMeterEventLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :usage_meter_event_logs do |t|
      if ActiveRecord::Base.connection.adapter_name == 'Mysql2'
        t.string :publishable_id, null: false, index: { unique: true }, collation: "utf8mb4_bin"
      else
        t.string :publishable_id, null: false, index: { unique: true }
      end
      t.references :usage_meter_customer, null: false, foreign_key: true
      t.references :usage_meter_event_type, null: false, foreign_key: true
      t.integer :quantity, default: 1, null: false
      t.string :version
      # t.references :usage_meter_aggregate, null: true, foreign_key: true

      if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
        t.jsonb :extra_data
      else
        t.json :extra_data
      end

      t.timestamps
    end
    add_index :usage_meter_event_logs, %i[usage_meter_customer_id usage_meter_event_type_id], name: :index_usage_meter_customer_types
  end
end
