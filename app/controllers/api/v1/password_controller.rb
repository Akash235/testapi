class Api::V1::PasswordController < ApiController
 

  # POST http://localhost:3000/api/v1/auth
  # $ curl --data "user[email]=user@example.com&user[password]=password" http://localhost:3000/api/v1/auth
  def update
  	
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

          	User.find(id["sub"]).update_attributes(password: params[:password])
            render json: {resp: "1", message: "passwordchnaged"}

          end
      end



  end


end






