class CreateUsageMeterCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :usage_meter_customers do |t|
      t.string :external_identifier
      t.string :external_type
      t.string :human_description
      t.text :metadata

      t.timestamps
    end
  end
end
