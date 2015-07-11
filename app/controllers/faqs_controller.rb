class FaqsController < BaseController
  before_action :set_faq, only: [:show]

  def index
    @faqs = Faq.order(created_at: :desc).page params[:page]
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_faq
    @faq = Faq.friendly.find(params[:id])
  end
end
