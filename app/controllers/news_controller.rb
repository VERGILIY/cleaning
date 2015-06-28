class NewsController < BaseController
  before_action :set_news, only: [:show]

  def index
    @news = News.order(created_at: :desc).page params[:page]
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_news
    @news = News.friendly.find(params[:id])
  end
end
