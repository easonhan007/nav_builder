json.extract! page, :id, :title, :slug, :position, :created_at, :updated_at
json.url page_url(page, format: :json)
