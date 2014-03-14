json.array!(@answers) do |answer|
  json.extract! answer, :id, :question_id, :person_id, :title, :body, :reg_date
  json.url answer_url(answer, format: :json)
end
