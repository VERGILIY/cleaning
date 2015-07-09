class Admin::NewsController < Admin::BaseController
  before_action :set_news, only: [:show, :edit, :update, :destroy, :publish]

  def index
    @news = News.order(created_at: :desc).page params[:page]
  end

  def show
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to admin_news_index_path, notice: 'Новость была успешно добавлена.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to admin_news_index_path, notice: 'Новость была успешно обновлена.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to admin_news_index_path, notice: 'Новость была успешно удалена.' }
      format.json { head :no_content }
    end
  end

  def publish
    @news.publish!
    respond_to do |format|
      format.html { redirect_to admin_news_index_path, notice: 'Новость была успешно опубликована.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_news
    @news = News.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def news_params
    params.require(:news).permit(:title, :slug, :content, :published, :cover, meta: [ :title, :keywords, :description ])
  end
end
