class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_company


  protected

  def redirect_if_logged
    if session[:company_id]
      flash[:error] = "You should not be logged in to access this area"
      redirect_to company_job_positions_path
    end
  end

  def redirect_if_not_logged
    unless session[:company_id]
      flash[:error] = "You should be logged in to access this area"
      redirect_to new_session_path
    end
  end

  def current_company
    if session[:company_id]
      @company ||= Company.find(session[:company_id])
    end
  end
end
