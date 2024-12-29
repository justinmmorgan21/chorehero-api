class ChoresController < ApplicationController
  def create
    @chore = Chore.new(
      parent_id: params[:parent_id],
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
end
