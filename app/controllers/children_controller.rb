class ChildrenController < ApplicationController
  def create
    @child = Child.new(
      parent_id: params[:parent_id],
      name: params[:name],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      birthdate: params[:birthdate],
      points_available: params[:points_available],
    )
    if @child.save
      render :show, status: :created
    else
      render json: { errors: child.errors.full_messages }, status: :bad_request
    end
  end
end