json.array!(@perfiles) do |perfil|
  json.extract! perfil, :id, :user, :nombre, :apellido, :rut, :fecha_nacimiento
  json.url perfil_url(perfil, format: :json)
end
