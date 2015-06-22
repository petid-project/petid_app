json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :pet_type, :breed, :color, :weight, :birth_year, :user_id, :chip_id, :description, :image_url
  json.url pet_url(pet, format: :json)
end
