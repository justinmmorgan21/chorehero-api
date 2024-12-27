class ChildrenController < ApplicationController
  def create
    child = Child.new(
      name: params[:name],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      birthdate: params[:birthdate],
      points_available: params[:points_available],
    )
    if child.save
      render json: { message: "Child created successfully" }, status: :created
    else
      render json: { errors: parent.errors.full_messages }, status: :bad_request
    end
  end
end
