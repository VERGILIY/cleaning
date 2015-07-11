class Admin::FaqsController < Admin::BaseController
  before_action :set_faq, only: [:show, :edit, :update, :destroy, :publish]

  def index
    @faqs = Faq.order(created_at: :desc).page params[:page]
  end

  def show
  end

  def new
    @faq = Faq.new
  end

  def edit
  end

  def create
    @faq = Faq.new(faqs_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to admin_faqs_path, notice: 'Полезная информация была успешно добавлена.' }
        format.json { render :show, status: :created, location: @faq }
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @faq.update(faqs_params)
        format.html { redirect_to admin_faqs_path, notice: 'Полезная информация была успешно обновлена.' }
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to admin_faqs_path, notice: 'Полезная информация была успешно удалена.' }
      format.json { head :no_content }
    end
  end

  # def publish
  #   @faq.publish!
  #   respond_to do |format|
  #     format.html { redirect_to admin_faqs_path, notice: 'Полезная информация была успешно опубликована.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_faq
    @faq = Faq.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faqs_params
    params.require(:faq).permit(:title, :slug, :content, :cover, meta: [ :title, :keywords, :description ])
  end
end
