class TicketsController < ApplicationController
  before_action :authenticate_user!
  def new
    @event = Event.find(params[:event_id])
  end
end
