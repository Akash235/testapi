class CreateUserTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_types do |t|
      t.string :permissions
      t.text :user_type
      t.references :user

      t.timestamps
    end
  end
end
