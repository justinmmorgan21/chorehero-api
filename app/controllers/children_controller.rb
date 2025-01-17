class ChildrenController < ApplicationController
  def create
    parent_user = current_parent_user
    @child = Child.new(
      parent_id: parent_user.id,
      name: params[:name],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      birthdate: params[:birthdate],
      points_available: 0,
      money_banked: 0
    )
    if @child.save
      render :show, status: :created
    else
      render json: { errors: @child.errors.full_messages }, status: :bad_request
    end
  end

  def index
    parent_user = current_parent_user
    if parent_user
      @children = Child.where(parent_id: parent_user.id).order(birthdate: :asc).order(name: :asc)
      render :index
    else
      render json: { error: "no user signed in" }, status: :bad_request
    end
  end

  def show
    @child = Child.find_by(id: params[:id])
    render :show
  end

  def update
    @child = Child.find_by(id: params[:id])
    if @child
      @child.assign_attributes(params.permit(:parent_id, :name, :username, :birthdate, :points_available, :money_banked).compact_blank)
  
      if @child.save
        render :show
      else
        render json: { error: @child.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Child not found" }, status: :not_found
    end
  end

  def current
    if current_child_user
      @child = Child.find_by(id: current_child_user.id)
      render :show
    else
      render json: { errors: "no current child signed in" }, status: :bad_request
    end
  end
end
