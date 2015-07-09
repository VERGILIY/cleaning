class News < ActiveRecord::Base
  extend FriendlyId

  mount_uploader :cover, CoverUploader

  friendly_id :title, use: :slugged

  # == VALIDATORS
  validates :title, presence: true

  # == SCOPES
  scope :published, -> { where(published: true) }

  def publish!
    update_attributes published: true
  end

  def should_generate_new_friendly_id?
    slug.blank? # || title_changed?
  end
end
