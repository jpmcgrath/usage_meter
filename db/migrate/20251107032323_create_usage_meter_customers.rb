class CreateUsageMeterCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :usage_meter_customers do |t|
      t.string :external_identifier
      t.string :external_type
      t.string :human_description
      if ActiveRecord::Base.connection.adapter_name == "PostgreSQL"
        t.jsonb :metadata
      else
        t.json :metadata
      end

      t.timestamps
    end
    add_index :usage_meter_customers, [ :external_type, :external_identifier ], unique: true
  end
end
