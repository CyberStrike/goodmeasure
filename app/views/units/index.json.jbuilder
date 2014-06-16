json.array!(@units) do |unit|
  json.extract! unit, :id, :name, :description, :cohort_id
  json.url unit_url(unit, format: :json)
end
