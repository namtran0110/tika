class EventsController < ApplicationController
  def index
    @events = Event.all
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
