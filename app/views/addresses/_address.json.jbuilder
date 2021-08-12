json.extract! address, :id, :postcode, :street, :complement, :district, :city, :state, :ibge_code, :citizen_id, :created_at, :updated_at
json.url address_url(address, format: :json)
