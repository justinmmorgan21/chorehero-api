class SessionsController < ApplicationController
  def create
    if Parent.find_by(username: params[:username])
      user = Parent.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        jwt = JWT.encode(
          {
            user_id: user.id, # the data to encode
            role: "parent",
            exp: 24.hours.from_now.to_i # the expiration time
          },
          Rails.application.credentials.fetch(:secret_key_base), # the secret key
          "HS256" # the encryption algorithm
        )
        render json: { jwt: jwt, username: user.username, user_id: user.id }, status: :created
      else
        render json: {}, status: :unauthorized
      end
    else
      user = Child.find_by(username: params[:username], parent_id: Parent.find_by(username: params[:parent_username]).id)
      if user && user.authenticate(params[:password])
        jwt = JWT.encode(
          {
            user_id: user.id, # the data to encode
            role: "child",
            exp: 24.hours.from_now.to_i # the expiration time
          },
          Rails.application.credentials.fetch(:secret_key_base), # the secret key
          "HS256" # the encryption algorithm
        )
        render json: { jwt: jwt, username: user.username, user_id: user.id }, status: :created
      else
        render json: {}, status: :unauthorized
      end
    end
  end
end





