class CreateUsageMeterEventLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :usage_meter_event_logs do |t|
      if ActiveRecord::Base.connection.adapter_name == 'Mysql2'
        t.string :publishable_id, null: false, index: { unique: true }, collation: "utf8mb4_bin"
      else
        t.string :publishable_id, null: false, index: { unique: true }
      end
      t.references :customer, null: false, foreign_key: true
      t.references :event_type, null: false, foreign_key: true
      t.integer :quantity, default: 1, null: false
      t.string :version
      # t.references :aggregate, null: true, foreign_key: true

      if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
        t.jsonb :extra_data
      else
        t.json :extra_data
      end

      t.timestamps
    end
    add_index :usage_meter_event_logs, %i[customer_id event_type_id]
  end
end
