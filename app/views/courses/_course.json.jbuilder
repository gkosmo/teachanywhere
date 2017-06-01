json.extract! course, :title, :content, :id

json.user do
	json.extract! course.user
end
json.up_votes course.votes_for.count
if user_signed_in?
	json.up_voted current_user.voted_for? course
end
