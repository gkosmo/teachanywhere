class AttendancesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new({ user: current_user, event: @event})
    @attendance.status = "Attending"
    if @attendance.save!
      redirect_to course_path(@attendance.event.course) 
         #format.js  <-- will render `app/views/reviews/create.js.erb`
    else
      redirect_to root_path(@event)
    end

  end
end
