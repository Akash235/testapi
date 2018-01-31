class Api::V1::OrdersController < ApiController
 

  def show
    # to show the order by id : --- curl -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjgsImV4cCI6MTUyMDAxOTk0OX0.dVW5OzQdJfv3JCumbAly4waHXTEaliftyqdqEsUpSN8" -X GET http://localhost:3000/api/v1/Order/3
    header  = request.headers['Authorization']
    num = JsonToken.where(token: header).ids
    numtos = num.to_s.split("[").last.split("]").first
    if numtos.nil?
      render json: {result: "Sorry, you need to sign in first"}
    else
      show = Order.find(params[:id])
   
      render json: show, except: [:created_at,:updated_at]

     end
  end
  # use this url to create the order :- 
  # curl -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjgsImV4cCI6MTUyMDAxOTk0OX0.dVW5OzQdJfv3JCumbAly4waHXTEaliftyqdqEsUpSN8" -X PUT -d '{"userId":"1","orders":{"orderTotal":"50.00","orderEstimate":"10.00","orderAdvance":"5.00","other_requirements":"some text","customer_request":"some text","couponId":"1","isBookedByAdmin":"1","isDefault":true}}' http://localhost:3000/api/v1/Order

  def create
    header  = request.headers['Authorization']
    num = JsonToken.where(token: header).ids
    numtos = num.to_s.split("[").last.split("]").first
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
      Order.create(user_id: params[:userId], orderTotal: params[:orders][:orderTotal] ,Order_Estimate: params[:orders][:orderEstimate], Order_Advance: params[:orders][:orderAdvance], Other_requirements: params[:orders][:other_requirements], Customer_request: params[:orders][:customer_request], isBookedByAdmin: params[:orders][:isBookedByAdmin])
      render json: {status: 200, message: "success", orderId: 1234,userId: params[:userId]}
    end
  end
  # use this url to update the order : - 
  # curl -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjgsImV4cCI6MTUyMDAxOTk0OX0.dVW5OzQdJfv3JCumbAly4waHXTEaliftyqdqEsUpSN8" -X PUT -d '{"userId":"1","orders":{"orderTotal":"50.00","orderEstimate":"10.00","orderAdvance":"5.00","other_requirements":"some text","customer_request":"some text","couponId":"1","isBookedByAdmin":"1","isDefault":true}}' http://localhost:3000/api/v1/Order/3
  def update
    header  = request.headers['Authorization']
    num = JsonToken.where(token: header).ids
    numtos = num.to_s.split("[").last.split("]").first
    if numtos.nil?
      render json: {result: "Sorry, you need to sign in first"}
    else
      Order.find(params[:id]).update(user_id: params[:userId], orderTotal: params[:orders][:orderTotal] ,Order_Estimate: params[:orders][:orderEstimate], Order_Advance: params[:orders][:orderAdvance], Other_requirements: params[:orders][:other_requirements], Customer_request: params[:orders][:customer_request], isBookedByAdmin: params[:orders][:isBookedByAdmin])
      render json: {status: 200, message: "success",userId: params[:userId]}
    end
  end
  # please use json token provided by your app
  # destroy url will be :-
  # curl -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjgsImV4cCI6MTUyMDAxOTk0OX0.dVW5OzQdJfv3JCumbAly4waHXTEaliftyqdqEsUpSN8" -X DELETE http://localhost:3000/api/v1/Order/3
  def destroy
    header  = request.headers['Authorization']
    num = JsonToken.where(token: header).ids
    numtos = num.to_s.split("[").last.split("]").first
    if numtos.nil?
      render json: {result: "Sorry, you need to sign in first"}
    else
      Order.find(params[:id]).delete
      render json: {status: 200, message: "success",userId: params[:userId]}
    end
  end


end
