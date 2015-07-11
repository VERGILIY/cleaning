class WelcomeController < BaseController
  def index
    @news = News.published.order(created_at: :desc).limit(5)
    @faqs = Faq.offset(rand(Faq.count)).limit(5)
  end
end
