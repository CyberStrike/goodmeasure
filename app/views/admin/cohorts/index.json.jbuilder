json.array!(@cohorts) do |cohort|
  json.extract! cohort, :id, :name, :description, :school_id
  json.url cohort_url(cohort, format: :json)
end
