class FormsController < ApplicationController
  def new
    @posting = Posting.find(params[:posting_id])
  	@form = @posting.forms.new
	 	setup_form(@form)
  end

  def show
  	@form = Form.find(params[:id])
  end

  private

  def setup_form(form)
  	category = form.categories.new(title: "Personal information")
  	category.fields.new(name: "first_name", field_class: 4)
  	category.fields.new(name: "middle_name", field_class: 4)
  	category.fields.new(name: "last_name", field_class: 4)
  	category.fields.new(name: "phone_number", field_class: 4)

    category.fields.new(name: "first_name1", field_class: 4, new_line: true)
    category.fields.new(name: "middle_name1", field_class: 4)
    category.fields.new(name: "last_name1", field_class: 4)
    category.fields.new(name: "phone_number1", field_class: 4)

  	category = form.categories.new(title: "Work experience")
  	category.fields.new(name: "employer", field_class: 8)
  	category.fields.new(name: "empoyment_duration", field_class: 4)

  	category = form.categories.new(title: "Education")
  	category.fields.new(name: "insitution", field_class: 8)
  	category.fields.new(name: "study_duration", field_class: 4)

  end

  def active_params
		params.require(:form).permit(:first_name, :middle_name, :last_name)
  end
end
