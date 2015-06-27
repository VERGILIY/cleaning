class CallRequest < ActiveRecord::Base
  # == VALIDATORS
  validates :fname, :phone, presence: true

  # == SCOPES
  scope :unprocessed, -> { where(processed: false) }

  def unprocessed?
   !processed?
  end

  def mark_as_processed!
    update_attributes processed: true
  end
end
