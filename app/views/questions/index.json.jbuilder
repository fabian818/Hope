json.array!(@questions) do |question|
  json.extract! question, :id, :patient_id, :person_id, :title, :body, :level, :reg_date
  json.url question_url(question, format: :json)
end
