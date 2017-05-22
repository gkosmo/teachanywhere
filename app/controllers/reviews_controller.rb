class ReviewsController < ApplicationController
  def new
  end

  def create
    if params[:review]
      @review = Review.new(review_params)
      getCourse
      @review.rewiew_id = @course.id
      @review.review_type = @course.class.name
      @review.user = current_user
      STDERR.puts @event
    end
    if @review.save!
      respond_to do |format|
        format.html { redirect_to course_path(@course) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      redirect_to root_path(@event)
    end

  end
private
  def getCourse
    @course = Course.find(params[:course_id])
  end
  def review_params
    params.require(:review).permit( :content)
  end

end
