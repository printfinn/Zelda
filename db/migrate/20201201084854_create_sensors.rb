class CreateSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :value
      t.string :token

      t.timestamps
    end
  end
end
