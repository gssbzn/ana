class Admin::SettingsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :is_administratior?
  
  before_action :set_setting, only:[:show, :edit, :update]
  
  def show
    
  end
  
  def edit    
  end

  def update
    respond_to do |format|
      if @setting.update(mineral_params)
        format.html { redirect_to @setting, notice: 'Configuraciones actualizadas.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mineral.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.first
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:app_name, :app_description, :author)
    end
end
