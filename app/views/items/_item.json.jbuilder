json.extract! item, :id, :link_name, :link_href, :description, :position, :created_at, :updated_at
json.url item_url(item, format: :json)
