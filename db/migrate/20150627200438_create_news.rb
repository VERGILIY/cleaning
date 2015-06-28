class CreateNews < ActiveRecord::Migration
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :news do |t|
      t.string :title, null: false
      t.string :slug
      t.text :content
      t.hstore :meta
      t.boolean :published, default: false

      t.timestamps null: false
    end
    add_index :news, :slug, unique: true
  end
end
