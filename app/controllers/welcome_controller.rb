class WelcomeController < BaseController
  def index
    @news = News.published.order(created_at: :desc).limit(5)
  end
end
