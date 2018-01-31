class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.boolean :isDefault
      t.string :Address_1
      t.string :Address_2
      t.string :Pincode
      t.string :City
      t.string :District
      t.string :State
      t.string :Lon
      t.string :Lat
      t.references :user


      t.timestamps
    end
  end
end
