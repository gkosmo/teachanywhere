class AttendancesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @event = Event.find(params[:event_id])

    @attendance = Attendance.where({ user: current_user, event: @event})
    if @attendance.blank?
      @attendance  = Attendance.new({ user: current_user, event: @event})
      @attendance.status = "Attending"
      @attendance.save!
      #  redirect_to course_path(@attendance.event.course)
         #format.js  <-- will render `app/views/reviews/create.js.erb`
    else
      a = @attendance.first.destroy
    #   redirect_to course_path(a.event.course)
  end
  end
end
