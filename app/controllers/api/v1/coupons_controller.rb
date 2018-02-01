class Api::V1::CouponsController < ApiController
  before_action :set_order, only: [:show, :update, :destroy]

  def show
    # to show the order by id : --- curl -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjgsImV4cCI6MTUyMDAxOTk0OX0.dVW5OzQdJfv3JCumbAly4waHXTEaliftyqdqEsUpSN8" -X GET http://localhost:3000/api/v1/Order/3
    header  = request.headers['Authorization']
    numtos = JsonAuthService.check(header)
    if numtos.nil?
      render json: {result: "Sorry, you need to sign in first"}
    else
      show = @coupon
      render json: show, except: [:created_at,:updated_at]

     end
  end
  # use this url to create the order :- 
  # curl -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjgsImV4cCI6MTUyMDAxOTk0OX0.dVW5OzQdJfv3JCumbAly4waHXTEaliftyqdqEsUpSN8" -X PUT -d '{"userId":"1","orders":{"orderTotal":"50.00","orderEstimate":"10.00","orderAdvance":"5.00","other_requirements":"some text","customer_request":"some text","couponId":"1","isBookedByAdmin":"1","isDefault":true}}' http://localhost:3000/api/v1/Order
  def create
   
    header  = request.headers['Authorization']
    numtos = JsonAuthService.check(header)
    if numtos.nil?
      render json: {result: "Sorry, you need to sign in first"}
    else
       #creating Order details by taking params 
       # params needed to create order
        # "{
        # "userId":"3",
        # "orders:{
        # "orderTotal":"50.00",
        # "orderEstimate":"10.00",
        # "orderAdvance":"5.00",
        # "other_requirements":"some text",
        # "customer_request":"some text",
        # "couponId":"1",
        # "isBookedByAdmin":"1",
        # "isDefault":true        

        # }
        # }
        # " 
      CouponDetail.create(order_params)
      render json: {status: 200, message: "success", orderId: 1234,userId: params[:userId]}
    end
  end
  # use this url to update the order : - 
  # curl -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjgsImV4cCI6MTUyMDAxOTk0OX0.dVW5OzQdJfv3JCumbAly4waHXTEaliftyqdqEsUpSN8" -X PUT -d '{"userId":"1","orders":{"orderTotal":"50.00","orderEstimate":"10.00","orderAdvance":"5.00","other_requirements":"some text","customer_request":"some text","couponId":"1","isBookedByAdmin":"1","isDefault":true}}' http://localhost:3000/api/v1/Order/3
  def update
    header  = request.headers['Authorization']
    numtos = JsonAuthService.check(header)
    if numtos.nil?
      render json: {result: "Sorry, you need to sign in first"}
    else
      @coupon.update(order_params)
      render json: {status: 200, message: "success",userId: params[:userId]}
    end
  end
  # please use json token provided by your app
  # destroy url will be :-
  # curl -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjgsImV4cCI6MTUyMDAxOTk0OX0.dVW5OzQdJfv3JCumbAly4waHXTEaliftyqdqEsUpSN8" -X DELETE http://localhost:3000/api/v1/Order/3
  def destroy
    header  = request.headers['Authorization']
    numtos = JsonAuthService.check(header)
    if numtos.nil?
      render json: {result: "Sorry, you need to sign in first"}
    else
      @coupon.delete
      render json: {status: 200, message: "success",userId: params[:userId]}
    end
  end

  private

  def set_order
    @coupon = CouponDetail.find(params[:id])
  end

  def order_params
    params.require(:coupons).permit!
  end


end
