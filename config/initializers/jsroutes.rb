JsRoutes.setup do |config|
  # Whitelist routes to include on the Front-End
  # NOTE: if you add a new route here, do not forget to run:
  #   s    rake tmp:cache:clear
  #       before restarting your `rails s`.
  config.include = [
    /^upvote_course$/, /^attendance_course_event$/
  ]
end
