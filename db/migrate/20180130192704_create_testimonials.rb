class CreateTestimonials < ActiveRecord::Migration[5.0]
  def change
    create_table :testimonials do |t|
	    t.references :User
	    t.string :Text_Content

        t.timestamps
    end
  end
end
