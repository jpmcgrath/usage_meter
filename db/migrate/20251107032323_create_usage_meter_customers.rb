class CreateUsageMeterCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :usage_meter_customers do |t|
      t.string :external_identifier
      t.string :external_type
      t.string :human_description
      t.column :jsonb, :metadata, default: {}.to_json, null: false

      t.timestamps
    end
    add_index :usage_meter_customers, [ :external_type, :external_identifier ], unique: true
  end
end
