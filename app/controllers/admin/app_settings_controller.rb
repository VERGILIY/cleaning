class Admin::AppSettingsController < Admin::BaseController
  def index
  end

  def upgrade
    app_settings_params.each do |key, val|
      AppSettings[key] = val
    end
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Настройки сохранены.' }
    end
  end

  private

    def app_settings_params
      params.require(:app_settings).permit(main: [{meta: [:title, :keywords, :description]}, :content],
                                           call_request: [meta: [:title, :keywords, :description]])
    end
end
