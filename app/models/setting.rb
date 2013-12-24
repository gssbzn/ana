class Setting < ActiveRecord::Base
  validate :settings_limit, :on => :create
  validate :app_name, presence: true
  
  def settings_limit
    if Setting.count >= 1
       errors.add(:base, I18n.t(:setings_limit, scope:'activerecord.errors.models.setting'))
    end
  end

end
