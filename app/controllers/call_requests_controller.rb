class CallRequestsController < BaseController

  def new
    @call_request = CallRequest.new
  end

  def create
    @call_request = CallRequest.new call_request_params

    respond_to do |format|
      if @call_request.save
        format.html { redirect_to root_path, notice: 'Ваш запрос принят. Мы Вам скоро перезвоним.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_request_params
      params.require(:call_request).permit(:fname, :lname, :mname, :phone)
    end
end
