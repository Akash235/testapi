class CreateVehicleModels < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_models do |t|

	  t.string :Make
	  t.string :Model_number
	  t.string :Varient

      t.timestamps
    end
  end
end
