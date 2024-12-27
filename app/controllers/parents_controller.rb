class ParentsController < ApplicationController
  def create
    @parent = Parent.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @parent.save
      render :show, status: :created
    else
      render json: { errors: parent.errors.full_messages }, status: :bad_request
    end
  end
end
