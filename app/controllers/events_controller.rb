class EventsController < ApplicationController
  def create
  end

  def new

  end
  def create
    if params[:event]
      getCourse

      @event = Event.new(event_params)
      @event.course=@course
      @event.user = current_user
      STDERR.puts @event
    end
    if @event.save!
      respond_to do |format|
        format.html { redirect_to course_path(@course) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      redirect_to root_path(@event)
    end

  end

  def index

  end

  def show
  end

  def attend
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


  private

  def getCourse
    @course = Course.find(params[:course_id])
  end

  def getEvent
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :content, :location, :min_attendance, :max_attendance, :date, :course_id)
  end
end
