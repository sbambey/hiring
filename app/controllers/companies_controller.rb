class CompaniesController < ApplicationController
  before_action :redirect_if_signed_in

  def new
  	@company = Company.new
  	@company.users.build
  end

  def create
  	@company = Company.new(company_params)
  	if @company.save
  		sign_in(@company.users.first)
  		redirect_to dashboard_path
  	else
  		render "new"
  	end
  end

  private

  def company_params
  	params.require(:company).permit(:name, users_attributes: [:username, :email, :password, :password_confirmation, :type])
  end

  def redirect_if_signed_in
    if user_signed_in?
      redirect_to root_path
    end
  end
end
