class EventsController < ApplicationController
  def index
    @events = Event.all
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
    @event = Event.new(event_params)
    @registered_application = RegisteredApplication.find(params[:registered_application_id])

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
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end
