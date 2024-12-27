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
      render json: { errors: @child.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @children = Child.all
    render :index
  end

  def show
    @child = Child.find_by(id: params[:id])
    render :show
  end

  def update
    @child = Child.find_by(id: params[:id])
    @child.parent_id = params[:parent_id] || @child.parent_id,
    @child.name = params[:name] || @child.name,
    @child.username = params[:username] || @child.username,
    @child.birthdate = params[:birthdate] || @child.birthdate,
    @child.points_available = params[:points_available] || @child.points_available,
    if @child.save
      render :show
    else
      render json: {error: @child.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
