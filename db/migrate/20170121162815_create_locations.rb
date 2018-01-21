class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.text :address_1
      t.text :address_2
      t.string :city
      t.string :pin_code
      t.string :district
      t.string :state
      t.boolean :is_verified
      t.string :created_by
      t.datetime :deleted_time

      t.timestamps
    end
  end
end
