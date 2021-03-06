class Api::V1::UserDetailsController < ApiController
  skip_before_action :authenticate_user!
 

  # http://localhost:3000/api/v1/locations/1.json
  def show
  end

  def create
	@user_detail = Location.create(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone], address_1: params[:address_1], address_2: params[:address_2], city: params[:city], pin_code: params[:pin_code], district: params[:district], state: params[:state], is_verified: params[:is_verified], created_by: params[:created_by])
	
	User.create(email: @user_detail.email, password: params[:password], password_confirmation: params[:password])
	render json: {result: "registration sucessfull"}
  end

 


end
