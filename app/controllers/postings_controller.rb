class PostingsController < ApplicationController
	before_action :authenticate_user!, except: [:show]

	def new
		@posting = Posting.new
	end

	def create
		@posting = current_user.company.postings.new(posting_params)
		if @posting.save
			flash[:success] = "Posting created successfully."
			redirect_to new_posting_form_path(@posting)
		else
			render 'new'
		end
	end

	def show
		@posting = Posting.find(params[:id])
	end

	private

	def posting_params
		params.require(:posting).permit(:title, :description)
	end
end
