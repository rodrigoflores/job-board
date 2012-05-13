class SessionsController < ApplicationController
  before_filter :redirect_if_logged, :except => :destroy
  before_filter :redirect_if_not_logged, :only => :destroy

  def new
  end

  def create
    @company = Company.where(:email => params[:company][:email]).first
    if @company && @company.valid_password?(params[:company][:password])
      session[:company_id] = @company.id
      redirect_to company_job_positions_path
    else
      flash[:error] = "Invalid user or password"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:company_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to new_session_path
  end
end