class AddCoverToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :cover, :string
  end
end
