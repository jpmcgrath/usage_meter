class CreateUsageMeterEventTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :usage_meter_event_types do |t|
      t.string :key, null: false, index: { unique: true }
      t.string :human_description

      t.timestamps
    end
  end
end
