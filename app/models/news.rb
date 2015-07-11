class News < Info
  # == SCOPES
  scope :published, -> { where(published: true) }

  def publish!
    update_attributes published: true
  end
end
