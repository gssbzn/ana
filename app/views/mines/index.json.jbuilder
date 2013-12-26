json.array!(@mines) do |mine|
  json.extract! mine, :id, :name, :description, :latitude, :longitude, :expected_capacity, :real_capacity
  json.url mine_url(mine, format: :json)
end
