class CreateUsageMeterEventTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :usage_meter_event_types do |t|
      if ActiveRecord::Base.connection.adapter_name == 'Mysql2'
        t.string :key, null: false, index: { unique: true }, collation: "utf8mb4_bin"
      else
        t.string :key, null: false, index: { unique: true }
      end
      t.string :human_description

      t.timestamps
    end
  end
end
