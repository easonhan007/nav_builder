json.extract! batch_item_record, :id, :section_id, :content, :created_at, :updated_at
json.url batch_item_record_url(batch_item_record, format: :json)
