class Api::V1::AuthenticationController < ApiController
  skip_before_action :authenticate_user!

  # POST http://localhost:3000/api/v1/auth
  # $ curl --data "user[email]=user@example.com&user[password]=password" http://localhost:3000/api/v1/auth
  def create
    user = User.find_by(email: params[:auth][:email])
    if user.valid_password? params[:auth][:password]
      render json: { token: JsonWebToken.encode(sub: user.id) }
    else
      render json: { errors: ["Invalid email or password"]}
    end
  end
end
