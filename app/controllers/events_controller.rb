class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show; end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path, notice: "Event created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "Event updated"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event deleted"
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_at, :image, :description, :place)
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end
end
