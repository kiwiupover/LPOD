class ApplicationController < ActionController::Base
  protect_from_forgery 
  
  def sidebar(industry, lpt)
    @industries = Industry.joins(:landing_pages).select('distinct industries.*').limit(10) if industry.nil? 
    @lpt = LandingPageType.joins(:landing_pages).select('distinct landing_page_types.*').limit(10) if lpt.nil?
  end 
  
  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
  
  def logout
    link_to "Log Out", logout_path
  end
  
  def login
    link_to "Log In", login_path
  end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
