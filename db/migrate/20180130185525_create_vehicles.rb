class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|

	  t.string :Registration_Number
	  t.boolean :isActive
	  t.string :Color
	  t.boolean :Is_rental
	  t.references :Vehicle_model
	  t.string :Vehicle_Notes
	  t.references :Rental_Detail
	  t.string :activeFrom

      t.timestamps
    end
  end
end
