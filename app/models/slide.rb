class Slide < ActiveRecord::Base
  include RankedModel
  ranks :position
  mount_uploader :slide, SlideUploader

  belongs_to :page

  before_save :refresh_default

  private

  def refresh_default
    if self.default?
      Slide.where.not(id: self.id).update_all(default: false)
    end
  end
end
