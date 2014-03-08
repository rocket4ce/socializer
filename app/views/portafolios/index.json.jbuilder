json.array!(@portafolios) do |portafolio|
  json.extract! portafolio, :id, :descripcion, :user_id
  json.url portafolio_url(portafolio, format: :json)
end
