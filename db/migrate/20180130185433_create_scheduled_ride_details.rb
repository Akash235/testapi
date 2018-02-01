class CreateScheduledRideDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :scheduled_ride_details do |t|

		t.string :Vehicle
		t.string :Caption
		t.string :Description
		t.string :Url_Location
		t.string :isDecoration


        t.timestamps
    end
  end
end


