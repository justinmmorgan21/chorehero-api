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
end
