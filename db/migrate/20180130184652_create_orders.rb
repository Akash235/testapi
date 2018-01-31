class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :orderTotal
      t.string :Order_Estimate
      t.string :Order_Advance
      t.string :Other_requirements
      t.string :Customer_request
      t.string :isBookedByAdmin
      t.references :user

      t.timestamps
    end
  end
end
