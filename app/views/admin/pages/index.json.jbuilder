json.array!(@pages) do |page|
  json.extract! page, :id, :title, :slug, :content, :topmenu, :submenu
  json.url page_url(page, format: :json)
end
