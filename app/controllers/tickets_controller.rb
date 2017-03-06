class TicketsController < ApplicationController
  before_action :authenticate_user!
  def new
    @event = Event.find(params[:event_id])
  end


  private

  def ticket_params
    params.require(:ticket).permit(:price, :name)
  end
end
