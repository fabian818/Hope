json.array!(@visits) do |visit|
  json.extract! visit, :id, :treatment_id, :assistance_date, :visit_type, :observation, :state
  json.url visit_url(visit, format: :json)
end
