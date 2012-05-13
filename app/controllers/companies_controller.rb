class CompaniesController < ApplicationController
  before_filter :redirect_if_logged_in

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])

    if @company.save
      #login do usuário
      session[:company_id] = @company.id

      #redirecionar
      redirect_to "/"
    else
      render 'new'
    end
  end
end
