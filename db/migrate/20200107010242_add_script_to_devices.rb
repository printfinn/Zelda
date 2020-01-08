class AddScriptToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :on_command, :text
    add_column :devices, :off_command, :text
  end
end
