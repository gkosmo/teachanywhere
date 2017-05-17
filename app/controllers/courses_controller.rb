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

  end

  def index
    @courses = Course.all
  end

  def show
  end

  private
  def getCourse
    @course = Course.find(params[:id])
  end
  def course_params
    params.require(:course).permit(:title, :content)
  end
end
