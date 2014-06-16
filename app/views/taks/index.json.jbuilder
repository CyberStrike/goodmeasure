json.array!(@taks) do |tak|
  json.extract! tak, :id, :description, :visibility
  json.url tak_url(tak, format: :json)
end
