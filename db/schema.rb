# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180131064514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coupon_details", force: :cascade do |t|
    t.string   "Name"
    t.string   "createdBy"
    t.boolean  "isFixedAmountDiscount"
    t.float    "discountApplicable"
    t.boolean  "isPerUser"
    t.integer  "reuseCount"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "decorations", force: :cascade do |t|
    t.string   "Name"
    t.string   "Decor_details"
    t.string   "Note"
    t.string   "Price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "enquiries_leads", force: :cascade do |t|
    t.integer  "User_id"
    t.string   "leadName"
    t.boolean  "isPerson"
    t.string   "Phone"
    t.string   "About"
    t.string   "Budget"
    t.string   "Email"
    t.string   "previousUsage"
    t.string   "referenceSource"
    t.string   "City"
    t.string   "interestedIn"
    t.string   "enquiryForDate"
    t.string   "adminComments"
    t.string   "followupDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["User_id"], name: "index_enquiries_leads_on_User_id", using: :btree
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "invoiceNumber"
    t.float    "invoiceAmount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "json_tokens", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.text     "address_1"
    t.text     "address_2"
    t.string   "city"
    t.string   "pin_code"
    t.string   "district"
    t.string   "state"
    t.boolean  "is_verified"
    t.string   "created_by"
    t.datetime "deleted_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "order_feedbacks", force: :cascade do |t|
    t.integer  "Order_id"
    t.string   "Vehicle_Rating"
    t.string   "Comments"
    t.string   "Driver_Behaviour_Rating"
    t.string   "Driver_Dressing"
    t.string   "Driver_Driving"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["Order_id"], name: "index_order_feedbacks_on_Order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.float    "orderTotal"
    t.string   "Order_Estimate"
    t.string   "Order_Advance"
    t.string   "Other_requirements"
    t.string   "Customer_request"
    t.string   "isBookedByAdmin"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "recordings", force: :cascade do |t|
    t.integer  "temp"
    t.string   "status"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_recordings_on_location_id", using: :btree
  end

  create_table "rental_plans", force: :cascade do |t|
    t.string   "Name"
    t.integer  "Vehicle_id"
    t.string   "Hours"
    t.float    "Rate"
    t.string   "DistanceAllowed"
    t.float    "PerHourExceededRate"
    t.float    "PerKmExceededRate"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["Vehicle_id"], name: "index_rental_plans_on_Vehicle_id", using: :btree
  end

  create_table "scheduled_ride_details", force: :cascade do |t|
    t.string   "Vehicle"
    t.string   "Caption"
    t.string   "Description"
    t.string   "Url_Location"
    t.string   "isDecoration"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.integer  "User_id"
    t.string   "Text_Content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["User_id"], name: "index_testimonials_on_User_id", using: :btree
  end

  create_table "user_addresses", force: :cascade do |t|
    t.boolean  "isDefault"
    t.string   "Address_1"
    t.string   "Address_2"
    t.string   "Pincode"
    t.string   "City"
    t.string   "District"
    t.string   "State"
    t.string   "Lon"
    t.string   "Lat"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_addresses_on_user_id", using: :btree
  end

  create_table "user_types", force: :cascade do |t|
    t.string   "permissions"
    t.text     "user_type"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_user_types_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string   "Make"
    t.string   "Model_number"
    t.string   "Varient"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "vehicle_pictures", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_rental_details", force: :cascade do |t|
    t.string   "Owner_Name"
    t.string   "Owner_Address"
    t.string   "Owner_Phone"
    t.string   "Rental_Start_Date"
    t.string   "Rental_End_Date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "Registration_Number"
    t.boolean  "isActive"
    t.string   "Color"
    t.boolean  "Is_rental"
    t.integer  "vehicle_model_id"
    t.string   "Vehicle_Notes"
    t.integer  "vehicle_rental_detail_id"
    t.string   "activeFrom"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["vehicle_model_id"], name: "index_vehicles_on_vehicle_model_id", using: :btree
    t.index ["vehicle_rental_detail_id"], name: "index_vehicles_on_vehicle_rental_detail_id", using: :btree
  end

end
