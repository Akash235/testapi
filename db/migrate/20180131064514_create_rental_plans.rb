class CreateRentalPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :rental_plans do |t|

	  t.string :Name
	  t.references :Vehicle 
	  t.string :Hours
	  t.float :Rate  
	  t.string :DistanceAllowed
	  t.flaot :PerHourExceededRate
	  t.float :PerKmExceededRate


      t.timestamps
    end
  end
end
