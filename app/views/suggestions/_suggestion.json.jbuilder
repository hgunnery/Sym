json.extract! suggestion, :id, :name, :description, :votes, :completed, :removed, :admin_suggested, :created_at, :updated_at
json.url suggestion_url(suggestion, format: :json)
