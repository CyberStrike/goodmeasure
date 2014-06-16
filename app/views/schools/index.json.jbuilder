json.array!(@schools) do |school|
  json.extract! school, :id, :name, :description
  json.url school_url(school, format: :json)
end
