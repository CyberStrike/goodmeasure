json.array!(@blockers) do |blocker|
  json.extract! blocker, :id, :blocker, :cohort_id
  json.url blocker_url(blocker, format: :json)
end
