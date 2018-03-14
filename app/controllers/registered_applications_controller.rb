 class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.url = params[:registered_application][:url]

    if @registered_application.save
      flash[:notice] = "Registered Application was saved."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error saving the Registered Application. Please try again."
      render :new
    end
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    #@events = @registered_application.events.group_by(&:name)
  end

  def destroy
  @registered_application = RegisteredApplication.find(params[:id])

  if @registered_application.destroy
    flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
    redirect_to registered_applications_path
  else
    flash.now[:alert] = "There was an error deleting the registered application."
    render :show
  end
end
end
