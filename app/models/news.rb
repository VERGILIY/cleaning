class News < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  # == VALIDATORS
  validates :title, presence: true

  # == SCOPES
  scope :published, -> { where(published: true) }

  def should_generate_new_friendly_id?
    slug.blank? # || title_changed?
  end
end
