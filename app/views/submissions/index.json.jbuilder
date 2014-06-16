json.array!(@submissions) do |submission|
  json.extract! submission, :id, :user_id, :task_id, :submission, :correctness, :percieved_points, :actual_points
  json.url submission_url(submission, format: :json)
end
