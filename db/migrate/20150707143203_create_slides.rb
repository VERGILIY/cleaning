class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.boolean :default, default: false
      t.integer :position
      t.references :page

      t.timestamps null: false
    end
  end
end
