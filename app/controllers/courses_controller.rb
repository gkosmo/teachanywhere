class CoursesController < ApplicationController
  before_action :getCourse, only: [:show]
  def create
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
end
