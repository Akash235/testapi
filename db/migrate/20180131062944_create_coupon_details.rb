class CreateCouponDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :coupon_details do |t|


	  t.string :Name
	 
	  t.string :createdBy
	  t.boolean :isFixedAmountDiscount
	  t.float :discountApplicable
	  t.boolean :isPerUser 
	  t.int :reuseCount


      t.timestamps
    end
  end
end
