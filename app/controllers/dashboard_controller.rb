class DashboardController < ApplicationController
	before_action :authenticate_user!
	
  def main
  end

  def team
  	@i = 1 
  	@company = current_user.company
  end
end
