class Admin::PagesController < Admin::BaseController
  include TheSortableTreeController::Rebuild

  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.nested_set.select('id, title, slug, content, parent_id').all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to [:admin, :pages], notice: 'Страница была успешно добавлена.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to [:admin, :pages], notice: 'Страница была успешно изменена.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @page.submenu? || @page.topmenu?
        format.html { redirect_to [:admin, :pages], alert: 'Вы не можете удалить эту страницу.' }
        format.json { head :no_content }
      else
        @page.destroy
        format.html { redirect_to [:admin, :pages], notice: 'Страница была успешно удалена.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :slug, :content, :topmenu, :submenu, meta: [ :title, :keywords, :description ])
    end
end
