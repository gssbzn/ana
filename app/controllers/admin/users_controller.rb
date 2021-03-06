# Modified Controller so only Admins can create users
class Admin::UsersController < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!
  skip_before_action :require_no_authentication, only: [:new, :create]
  before_filter :is_administratior?, only: [:new, :create, :index]

  # GET /admin/users/new
  # GET /admin/users/new.json
  def new    
    super
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?

      set_flash_message :notice, 'actioncontroller.user.created' if is_flashing_format?
      #sign_up(resource_name, resource)
      respond_with resource, :location => after_sign_up_path_for(resource)

    else
      clean_up_passwords resource
      respond_with resource
    end
  end
  
  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = User.select(:id, :username, :email, :name, :lastname).order(:username)
  end
end
