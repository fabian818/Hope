json.array!(@people) do |person|
  json.extract! person, :id, :login, :password, :dni, :name, :paternal_last, :maternal_last, :years, :sex, :address, :date_birth, :permission, :state
  json.url person_url(person, format: :json)
end
