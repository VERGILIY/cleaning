json.array!(@slides) do |slide|
  json.extract! slide, :id, :title, :default, :position
  json.url slide_url(slide, format: :json)
end
