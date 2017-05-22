# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Course.destroy_all
Event.destroy_all
User.destroy_all
password = Faker::Internet.password(8)
puts password
10.times do
  u = User.new({
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password
    })
    u.save!
    p u
end
 User.all.sample
10.times do
  text = Faker::Space.agency + "from" + Faker::Space.planet + "is lanetabout" +  Faker::Hipster.sentence

    course = Course.new({
    user_id: User.all.sample.id,
    title:Faker::Educator.course,
    content: text
   });
    course.save!
end
37.times do
  text = Faker::Company.bs + Faker::Company.bs + Faker::Company.bs
  sleep(1.minutes)
  ev = Event.new({
    course_id: Course.all.sample.id,
    date: Faker::Date.forward(23),
    title: Faker::Educator.course,
    content: text,
    user_id:  User.all.sample.id,
    location: Faker::Address.street_address,
    min_attendance: 2,
    max_attendance: 7
    })
    ev.save!
  end

User.all.each do |us|
  rand(1..6).times do
      course = Couse.sample
      unless course.user == us || !Subscription.where(user: us, course: course).empty? 
        sub= Subscription.new(course: course, user: us)
        sub.save!
      end
  end
end
