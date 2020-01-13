class AddOrderToDevices < ActiveRecord::Migration[6.0]
  def up
  	add_column :devices, :device_order, :integer, default: 0
  	Device.update_all device_order: 0
  end

  def down
  	remove_column :devices, :device_order
  end
end
