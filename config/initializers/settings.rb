$app_name = 'APP'
$app_author = 'Gustavo Bazan'.html_safe
$app_description = 'Webapp'.html_safe
if Setting.table_exists?
  setting = Setting.first
  if setting
    $app_name = setting.app_name
    $app_author = setting.author
    $app_description = setting.app_description
  end
end
