# Allows leads and owners to modify users

class UserController < ApplicationController
	before_action :authenticate_user!
	before_action :verify_priviliges

  def new
	  @user = User.new
	end

	def create
	  @user = User.new(user_params)

	  if @user.save
	    flash[:notice] = "Successfully created member." 
	    redirect_to dashboard_team_path
	  else
	    render 'new'
	  end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(update_params)
			flash[:notice] = "Sucessfully updated user."
		else
			flash[:danger] = "There was a problem updating that user."
		end
		redirect_to dashboard_team_path
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:notice] = "Sucessfully deleted user."
		else
			flash[:danger] = "There was a problem deleting that user."
		end
		redirect_to dashboard_team_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :type, :company_id)
  end

  def update_params
  	params.require(:user).permit(:type, :company_id)
  end

  def verify_priviliges
  	if !current_user.has_priviliges?
  		redirect_to dashboard_team_path
  	end
  end
end

