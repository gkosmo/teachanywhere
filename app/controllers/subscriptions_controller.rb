class SubscriptionsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @subscription = Subscription.new({ user: current_user, course: @course})
    if @subscription.save!
      respond_to do |format|
        format.html { redirect_to course_path(@course) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      redirect_to root_path(@event)
    end
  end

  def new
  end

  def index
  end

  def show
  end
end
