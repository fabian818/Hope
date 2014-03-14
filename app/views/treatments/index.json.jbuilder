json.array!(@treatments) do |treatment|
  json.extract! treatment, :id, :patient_id, :specialist_id, :treatment_type, :start_date, :end_date, :observation
  json.url treatment_url(treatment, format: :json)
end
