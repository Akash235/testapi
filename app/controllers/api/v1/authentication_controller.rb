class Api::V1::AuthenticationController < ApiController
  skip_before_action :authenticate_user!

  # POST http://localhost:3000/api/v1/auth
  # $ curl --data "user[email]=user@example.com&user[password]=password" http://localhost:3000/api/v1/auth
  def create
    user = User.find_by(email: params[:email])
    if user.valid_password? params[:password]
      render json: { token: JsonWebToken.encode(sub: user.id) }
      JsonToken.create(token: JsonWebToken.encode(sub: user.id))
    else
      render json: { errors: ["Invalid email or password"]}
    end
  end

  def destroy
    header  = request.headers['Authorization']

    num = JsonToken.where(token: header).ids
    numtos = num.to_s.split("[").last.split("]").first
    if numtos.nil?
      render json: {result: "Sorry, you need to sign in first"}
    else

      JsonToken.find(numtos).delete
      render json: { result: "logout sucessfull"}

    end

  end

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

            a = Location.find_by_email(User.find(id["sub"]).email)

            render json: {id: User.find(id["sub"]).id, Name: a.first_name + " " + a.last_name}

          end
      end



  end











end
