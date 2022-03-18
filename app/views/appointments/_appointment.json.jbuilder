json.extract! appointment, :id, :name, :description, :start_hout, :end_hour, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
