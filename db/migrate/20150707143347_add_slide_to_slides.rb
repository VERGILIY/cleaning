class AddSlideToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :slide, :string
  end
end
