class Admin::SlidesController < Admin::BaseController
  before_action :set_slide, only: [:show, :edit, :update, :destroy, :update_position]

  def index
    @slides = Slide.rank(:position).all
  end

  def show
  end

  def new
    @slide = Slide.new
  end

  def edit
  end

  def create
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to [:admin, :slides], notice: 'Слайд был успешно добавлен.' }
        format.json { render :show, status: :created, location: @slide }
      else
        format.html { render :new }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @slide.update(slide_params)
        format.html { redirect_to [:admin, :slides], notice: 'Слайд был успешно обновлен.' }
        format.json { render :show, status: :ok, location: @slide }
      else
        format.html { render :edit }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, :slides], notice: 'Слайд был успешно удален.' }
      format.json { head :no_content }
    end
  end

  def update_position
    @slide.position_position = slide_params[:position]
    @slide.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_params
      params.require(:slide).permit(:title, :default, :position, :page_id, :slide)
    end
end
