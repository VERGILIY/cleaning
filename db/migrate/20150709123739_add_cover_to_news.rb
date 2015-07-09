class AddCoverToNews < ActiveRecord::Migration
  def change
    add_column :news, :cover, :string
  end
end
