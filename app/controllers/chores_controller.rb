class ChoresController < ApplicationController
  def create
    parent_user = current_parent_user
    @chore = Chore.new(
      parent_id: parent_user.id,
      title: params[:title],
      description: params[:description],
      monday: params[:monday],
      tuesday: params[:tuesday],
      wednesday: params[:wednesday],
      thursday: params[:thursday],
      friday: params[:friday],
      saturday: params[:saturday],
      sunday: params[:sunday],
      one_timer: params[:one_timer],
      points_awarded: params[:points_awarded],
    )
    if @chore.save
      render :show, status: :created
    else
      render json: { errors: @chore.errors.full_messages }, status: :bad_request
    end
  end

  def index
    parent_user = current_parent_user
    if parent_user
      @chores = Chore.where(parent_id: parent_user.id)
      render :index
    else
      render json: { error: "no user signed in" }, status: :bad_request
    end
  end
end
