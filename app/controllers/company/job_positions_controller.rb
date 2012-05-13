class JobPositionsForCompaniesController < ApplicationController
  before_filter :redirect_if_not_logged

  def index
    @job_positions = current_company.job_positions
  end

  def new
    @job_position = current_company.job_positions.new
  end

  def create
    @job_position = current_company.job_positions.new(params[:job_position])

    if @job_position.save
      flash[:notice] = "You have created a job position successfully"

      redirect_to job_positions_path
    else
      render 'new'
    end
  end

  def edit
    @job_position = current_company.job_positions.find(params[:id])
  end

  def update
    @job_position = current_company.job_positions.find(params[:id])

    if @job_position.update_attributes(params[:job_position])
      flash[:notice] = "You have updated successfully"

      redirect_to job_positions_path
    else
      render 'edit'
    end
  end

  def destroy
    @job_position = current_company.job_positions.find(params[:id])

    @job_position.destroy

    flash[:notice] = "You have deleted successfully"

    redirect_to job_positions_path
  end
end