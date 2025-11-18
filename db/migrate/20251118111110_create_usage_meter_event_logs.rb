class CreateUsageMeterEventLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :usage_meter_event_logs do |t|
      t.string :publishable_id
      t.references :customer, null: false, foreign_key: true
      t.references :event_type, null: false, foreign_key: true
      t.integer :quantity
      t.json :extra_data
      t.string :version
      t.references :aggregate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
