class CreateInfos < ActiveRecord::Migration
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :infos do |t|
      t.string :title, null: false
      t.string :slug
      t.text :content
      t.hstore :meta
      t.boolean :published, default: false
      t.string :type

      t.timestamps null: false
    end
    add_index :infos, :slug, unique: true
  end
end
