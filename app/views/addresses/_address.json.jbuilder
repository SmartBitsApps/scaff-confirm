json.extract! address, :id, :addressable_id, :addressable_type, :residence, :street, :street_number, :city, :zip_code, :state, :created_at, :updated_at
json.url address_url(address, format: :json)