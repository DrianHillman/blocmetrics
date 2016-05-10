class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @application = Application.find(params[:id])
    @events = @application.events.group_by(&:name)
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

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    @application.name = params[:application][:name]
    @application.url = params[:application][:url]

    if @application.save
      flash[:notice] = "Your site was updated successfully!"
      redirect_to registered_application_path(@application.id)
    else
      flash.now[:alert] = "There was an error saving the new site. Please try again."
      render :edit
    end
  end

  def destroy
    @application = Application.find(params[:id])

    if @application.destroy
      flash[:notice] = "\"#{@application.name}\" was deleted successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error deleting the site."
      render :show
    end
  end
end
