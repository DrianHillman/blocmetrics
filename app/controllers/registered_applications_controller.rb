class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @application = Application.find(params[:id])
  end

  def new
    @user = current_user
    @application = @user.applications.new
  end

  def create
    @user = current_user
    @application = @user.applications.new
    @application.name = params[:application][:name]
    @application.url = params[:application][:url]

    if @application.save
      flash[:notice] = "Your site was saved successfully!"
      redirect_to registered_application_path(@application.id)
    else
      flash.now[:alert] = "There was an error saving the new site. Please try again."
      render :new
    end
  end
end
