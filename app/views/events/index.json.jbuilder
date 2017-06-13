json.courses do
  json.array! @course.events do |event|
    json.partial! "events/event", event: event
  end
end
