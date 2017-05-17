class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @new_course = Course.new()
    @courses = Course.all.last(5)
  end
end
