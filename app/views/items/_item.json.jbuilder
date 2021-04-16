json.extract! item, :id, :Name, :Description, :Price, :created_at, :updated_at
json.url item_url(item, format: :json)
