json.array!(@reports) do |report|
  json.extract! report, :id, :date_of_loss, :location, :user_id, :pet_id, :description, :notes
  json.url report_url(report, format: :json)
end
