class Admin::CallRequestsController < Admin::BaseController
  before_action :set_call_request, only: [:show, :edit, :update, :destroy, :mark_as_processed]

  def index
    @call_requests = CallRequest.order(created_at: :desc).page params[:page]
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @call_request.update call_request_params
        format.html { redirect_to @call_request, notice: 'Запрос звонка успешно изменен.' }
        format.json { render :show, status: :ok, location: @call_request }
      else
        format.html { render :edit }
        format.json { render json: @call_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @call_request.destroy
    respond_to do |format|
      format.html { redirect_to admin_call_requests_url, notice: 'Запрос звонка успешно удален.' }
      format.json { head :no_content }
    end
  end

  def mark_as_processed
    @call_request.mark_as_processed!
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Запрос звонка помечен как обработанный.' }
      format.json { render json: @call_request }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call_request
      @call_request = CallRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_request_params
      params.require(:call_request).permit(:fname, :lname, :mname, :phone)
    end
end
