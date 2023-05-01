class AttendancesController < ApplicationController
  def create
    attendance = current_user.attendances.create(event_id: params[:event_id])
    redirect_to attendance.event
  end

  def destroy
    attendance = current_user.attendances.find_by(event_id: params[:event_id])
    attendance.destroy
    redirect_to attendance.event
  end
end
