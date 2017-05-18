class AttendancesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new({ user: current_user, event: @event})
    @attendance.status = "Attending"
    if @attendance.save!
      respond_to do |format|
        format.html { redirect_to course_path(@attendance.event.course) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      redirect_to root_path(@event)
    end
  end
end
