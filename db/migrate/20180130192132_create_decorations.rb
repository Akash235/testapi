class CreateDecorations < ActiveRecord::Migration[5.0]
  def change
    create_table :decorations do |t|
		t.string :Name
		t.string :Decor_details
		t.string :Note 
		t.string :Price

        t.timestamps
    end
  end
end
