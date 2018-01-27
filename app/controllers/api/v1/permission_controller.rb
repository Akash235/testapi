class Api::V1::PermissionController < ApiController
 

  # POST http://localhost:3000/api/v1/auth
  # $ curl --data "user[email]=user@example.com&user[password]=password" http://localhost:3000/api/v1/auth
  def show
    header  = request.headers['Authorization']
    num = JsonToken.where(token: header).ids
    numtos = num.to_s.split("[").last.split("]").first
    if numtos.nil?
      render json: {result: "Sorry, you need to sign in first"}
    else

      render json: { result: "" }
    end



  end


end
