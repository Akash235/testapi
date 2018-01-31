class CreateEnquiriesLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :enquiries_leads do |t|
	  t.references :User
	  t.string :leadName
	  t.boolean :isPerson  
	  t.string :Phone 
	  t.string :About
	  t.string :Budget
	  t.string :Email
	  t.string :previousUsage
	  t.string :referenceSource
	  t.string :City
	  t.string :interestedIn
	  t.string :enquiryForDate
	  t.string :adminComments
	  t.string :followupDate


      t.timestamps
    end
  end
end
