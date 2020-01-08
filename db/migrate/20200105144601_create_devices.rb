class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :device_name
      t.string :device_type
      t.string :device_location

      t.timestamps
    end
  end
end
