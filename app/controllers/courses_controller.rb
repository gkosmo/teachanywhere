class CoursesController < ApplicationController
  before_action :getCourse, only: [:show]
  def create
    if params[:course]
      @course = Course.new(course_params)

      @course.user = current_user
    end
    if @course.save
      respond_to do |format|
        format.html { redirect_to course_path(@course) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      redirect_to root_path(@course)
    end

  end

  def new
    @course=Course.new
  end

  def index
    @courses = Course.all
  end

  def show
    @event = Event.new({user: current_user, course: @course})
    check_attendance
    @subscription = Subscription.new() if @current_user_course_subscription.empty?
    @teacher = @course.user == current_user
    @reviews = Review.where(rewiew_id: @course.id)
    @review = Review.new()
  end
  def upvote
    @course = Course.find(params[:id])
    if current_user.voted_for? @course
      current_user.unvote_for @course
    else
      current_user.up_votes @course
    end
    redirect_to root_path
  end

  private
  def getCourse
    @course = Course.find(params[:id])
  end
  def course_params
    params.require(:course).permit(:title, :content)
  end

  def check_attendance
    #false if no attendance
    course = Course.find(params[:id])
    @current_user_course_subscription = course.subscriptions.where(user: current_user)
  end
end
