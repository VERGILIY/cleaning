class CreatePages < ActiveRecord::Migration
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug
      t.text :content
      t.hstore :meta
      t.boolean :topmenu, default: false
      t.boolean :submenu, default: false

      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true

      # optional fields
      t.integer :depth, null: false, default: 0
      t.integer :children_count, null: false, default: 0

      t.timestamps null: false
    end
    add_index :pages, :slug, unique: true
  end
end
