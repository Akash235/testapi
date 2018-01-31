class CreateVehicleRentalDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_rental_details do |t|
		t.string :Owner_Name
		t.string :Owner_Address
		t.string :Owner_Phone
		t.string :Rental_Start_Date
		t.string :Rental_End_Date

        t.timestamps
    end
  end
end
