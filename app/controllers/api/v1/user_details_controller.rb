class Api::V1::UserDetailsController < ApiController
  skip_before_action :authenticate_user!
 

  # http://localhost:3000/api/v1/locations/1.json
  def show
      

      header  = request.headers['Authorization']
      id = JsonWebToken.decode header
      if id["sub"].nil?

        render json: {result: "Sorry, you need to sign in first"}

      else
        

        num = JsonToken.where(token: header).ids
        numtos = num.to_s.split("[").last.split("]").first
        if numtos.nil?
          render json: {result: "Sorry, you need to sign in first"}
        else

          @user_detail = Location.find(id["sub"])
          render json: {userinfo: @user_detail}
        end
      end

  end

  def create

     


    	@user_detail = Location.create(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone], address_1: params[:address_1], address_2: params[:address_2], city: params[:city], pin_code: params[:pin_code], district: params[:district], state: params[:state], is_verified: params[:is_verified], created_by: params[:created_by])
    	
    	@user = User.create(email: @user_detail.email, password: params[:password], password_confirmation: params[:password])
    	
      UserMailer.welcome_email(@user).deliver_now

      render json: {result: "registration sucessfull"}

  end


  def update

      header  = request.headers['Authorization']
      id = JsonWebToken.decode header
      if id["sub"].nil?

        render json: {result: "Sorry, you need to sign in first"}

      else
          if numtos.nil?
            render json: {result: "Sorry, you need to sign in first"}
          else

            Location.find(id["sub"]).update(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone], address_1: params[:address_1], address_2: params[:address_2], city: params[:city], pin_code: params[:pin_code], district: params[:district], state: params[:state], is_verified: params[:is_verified], created_by: params[:created_by])
            render json: {result: "updation sucessfull"}

          end
      end



  end



 


end
