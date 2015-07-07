class Page < ActiveRecord::Base
  include TheSortableTree::Scopes
  extend FriendlyId

  friendly_id :title, use: :slugged

  acts_as_nested_set

  has_many :slides

  # == VALIDATORS
  validates :title, presence: true

  # == SCOPES
  scope :topmenu, -> { where(topmenu: true) }
  scope :submenu, -> { where(submenu: true) }

  def should_generate_new_friendly_id?
    slug.blank? # || title_changed?
  end
end
