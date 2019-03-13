json.extract! timeslot, :id, :teacher, :dow, :start_time, :state, :footnote, :created_at, :updated_at
json.url timeslot_url(timeslot, format: :json)
