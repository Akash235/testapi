class Vehicle < ApplicationRecord
	belongs_to :vehicle_model
	belongs_to :vehicle_rental_detail
end
