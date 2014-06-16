json.array!(@tasks) do |task|
  json.extract! task, :id, :description, :visibility, :unit_id
  json.url task_url(task, format: :json)
end
