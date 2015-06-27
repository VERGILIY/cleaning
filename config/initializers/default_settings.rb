if ActiveRecord::Base.connection.table_exists?(:settings) and ActiveRecord::Base.connection.column_exists?(:settings, :thing_id)
  AppSettings.save_default(:main, { content: 'Страница находится в разработке',
                                    meta: { title: 'Тайтл находится в разработке',
                                            keywords: 'Кейворды находятся в разработке',
                                            description: 'Дескрипшон находится в разработке' } })

  AppSettings.save_default(:call_request, { meta: { title: 'Тайтл находится в разработке',
                                                    keywords: 'Кейворды находятся в разработке',
                                                    description: 'Дескрипшон находится в разработке' } })
end