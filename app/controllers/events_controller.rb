class EventsController < ApplicationController
  def index 
    @registered_application = RegisteredApplication.find(params[:registered_application_id])
    @events = @registered_application.events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @registered_application = RegisteredApplication.find(params[:registered_application_id])
    @event = Event.new(event_params)
    @event.registered_application = @registered_application

    if @event.save
      flash[:notice] = "Event saved to your application tracker"
      redirect_to @registered_application
    else
      flash[:notice] = "Error saving event. Please try again."
      render :new
    end
  end

  def update
  end

  def destroy
    @event = Event.find(params[:id])
    @registered_application = RegisteredApplication.find(params[:registered_application_id])

    if @event.destroy
      flash[:notice] = "Event #{@event.name} has been deleted."
      redirect_to @registered_application
    else
      flash[:notice] = "Error deleting event"
    end
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end
