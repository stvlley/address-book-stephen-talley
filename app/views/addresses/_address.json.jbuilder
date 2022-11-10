json.extract! address, :id, :street, :town, :zip_code, :state, :country, :created_at, :updated_at
json.url person_address_url(address, format: :json)
