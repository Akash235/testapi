class CreateVehiclePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_pictures do |t|

      t.timestamps
    end
  end
end
