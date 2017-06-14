json.extract! event, :title, :content, :date, :min_attendance, :max_attendance, :location, :id, :course
if user_signed_in?
  json.attended  event.attendances.where(user: current_user).empty?
end
