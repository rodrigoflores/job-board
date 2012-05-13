class JobPositionsController < ApplicationController
  def index
    @job_positions = JobPosition.all
  end

  def show
    @job_position = JobPosition.find(params[:id])
  end
end