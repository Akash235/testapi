class CreateOrderFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :order_feedbacks do |t|
		t.references :Order 
		t.string :Vehicle_Rating
		t.string :Comments
		t.string :Driver_Behaviour_Rating
		t.string :Driver_Dressing
		t.string :Driver_Driving

        t.timestamps
    end
  end
end
