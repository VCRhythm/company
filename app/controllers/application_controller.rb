class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'default'
  before_action :set_header_links

  def after_sign_in_path_for(resource)
      dashboard_path
  end
  
  def authenticate_employee!
    authenticate_user!
    if !current_user.employee?
      redirect_to root_url, notice: 'Invalid access'
    end
  end

  protected
  def set_header_links
    page = Page.find_by(title:'Header')
    if page
      @header_links = page.links
    else
      @header_links = Array.new(0)
    end
  end
end
