class Api::V1::PermissionController < ApiController
 

  # POST http://localhost:3000/api/v1/auth
  # $ curl --data "user[email]=user@example.com&user[password]=password" http://localhost:3000/api/v1/auth
  def show

    render json: { result: "comming soon" }

  end
end
