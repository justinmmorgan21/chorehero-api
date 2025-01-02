class ChildChoresController < ApplicationController
  def create
    @childChore = ChildChore.new(
      child_id: params[:child_id],
      chore_id: params[:chore_id],
      active: true,
      date_activated: Date.current,
      date_inactivated: nil,
      done_mon: false,
      done_tue: false,
      done_wed: false,
      done_thu: false,
      done_fri: false,
      done_sat: false,
      done_sun: false,
      done_weekly: false,
    )
    if @childChore.save
      render :show, status: :created
    else
      render json: { errors: @childChore.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @childChores = ChildChore.all
    if @childChores
      render json: @childChores
    else
      render json: { errors: @childChores.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @childChore = ChildChore.find_by(id: params[:id])
    if @childChore
      @childChore.assign_attributes(params.permit(:child_id, :chore_id, :active, :date_activated, :date_inactivated, :done_mon, :done_tue, :done_wed, :done_thu, :done_fri, :done_sat, :done_sun, :done_weekly).compact_blank)

      if @childChore.save
        render :show
      else
        render json: { error: @childChore.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "ChildChore not found" }, status: :not_found
    end
  end
end
