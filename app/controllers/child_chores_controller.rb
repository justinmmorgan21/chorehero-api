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
    @child_chores = ChildChore.all
    if @child_chores
      render :index
    else
      render json: { errors: @child_chores.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @child_chore = ChildChore.find_by(child_id: params[:child_id], chore_id: params[:chore_id])
    render :show
  end

  def update
    @child_chore = ChildChore.find_by(child_id: params[:child_id], chore_id: params[:chore_id])
    if @child_chore
      @child_chore.assign_attributes(params.permit(:child_id, :chore_id, :active, :date_activated, :date_inactivated, :done_mon, :done_tue, :done_wed, :done_thu, :done_fri, :done_sat, :done_sun, :done_weekly).compact_blank)

      if @child_chore.save!
        render :show
      else
        render json: { error: @child_chore.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "ChildChore not found" }, status: :not_found
    end
  end
end
