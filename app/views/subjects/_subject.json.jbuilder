json.extract! subject, :id, :name, :description, :content, :created_at, :updated_at
json.url subject_url(subject, format: :json)
