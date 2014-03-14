json.array!(@results) do |result|
  json.extract! result, :id, :visit_id, :description, :reg_date
  json.url result_url(result, format: :json)
end
