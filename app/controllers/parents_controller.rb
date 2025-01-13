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
      render json: { errors: @parent.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @parents = Parent.all
    render :index
  end

  def show
    @parent = Parent.find_by(id: params[:id])
    if @parent
      render :show
    else
      render json: { errors: "no parent with that id" }, status: :bad_request
    end
  end

  def current
    if current_parent_user
      @parent = Parent.find_by(id: current_parent_user.id)
      render :show
    else
      render json: { errors: "no current parent signed in" }, status: :bad_request
    end
  end
end
