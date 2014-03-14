json.array!(@patients) do |patient|
  json.extract! patient, :id, :person_id, :targa
  json.url patient_url(patient, format: :json)
end
