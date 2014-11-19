json.array!(@assignees) do |assignee|
  json.extract! assignee, :id, :first_name, :last_name, :job_title
  json.url assignee_url(assignee, format: :json)
end
