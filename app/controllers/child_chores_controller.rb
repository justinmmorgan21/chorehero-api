class ChildChoresController < ApplicationController
  def create
    @child_chore = ChildChore.new(
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
    if @child_chore.save!
      render :show, status: :created
    else
      render json: { errors: @child_chore.errors.full_messages }, status: :bad_request
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
      @child_chore.assign_attributes(params.permit(:active, :date_activated, :date_inactivated, :done_mon, :done_tue, :done_wed, :done_thu, :done_fri, :done_sat, :done_sun, :done_weekly).compact_blank)
      @child_chore[:chore_id] = params[:new_chore_id] || @child_chore[:chore_id]
      @child_chore[:done_weekly] = @child_chore.doneWeekly

      if @child_chore.save!
        @child = Child.find_by(id: @child_chore.child_id)
        render :update
      else
        render json: { error: @child_chore.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "ChildChore not found" }, status: :not_found
    end
  end
end
