class TicketTypesController < ApplicationController

  def new
    event = Event.find(params[:event_id])
    @ticket_type = event.ticket_types.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket_type }
    end
  end

  def edit
    event = Event.find(params[:event_id])
    @ticket_type = event.ticket_types.find(params[:id])
  end

  def create
    event = Event.find(params[:event_id])
    @ticket_type = event.ticket_types.create(ticket_type_params)
    respond_to do |format|
      if @ticket_type.save
        format.html { redirect_to([@ticket_type.event, @ticket_type], :notice => 'Ticket type was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.xml  { render :xml => @ticket_type, :status => :created, :location => [@ticket_type.event, @ticket_type] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    #1st you retrieve the post thanks to params[:post_id]
    event = Event.find(params[:event_id])
    #2nd you retrieve the comment thanks to params[:id]
    @ticket_type = event.ticket_types.find(params[:id])

    respond_to do |format|
      if @ticket_type.update_attributes(params[:ticket_type])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@ticket_type.event, @ticket_type], :notice => 'ticket type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
    event = Event.find(params[:event_id])
    @ticket_type = event.ticket_types

    respond_to |format|
        format.html
    format.xml { render :xml => @ticket_types}
  end

  def show
    event = Event.find(params[:event_id])
    @ticket_type = event.ticket_types.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket_type }
    end
  end

  def destroy
    #1st you retrieve the post thanks to params[:post_id]
    event = event.find(params[:event_id])
    #2nd you retrieve the comment thanks to params[:id]
    @ticket_type = event.ticket_types.find(params[:id])
    @ticket_type.destroy

    respond_to do |format|
      #1st argument reference the path /posts/:post_id/comments/
      format.html { redirect_to(event_ticket_types_url) }
      format.xml  { head :ok }
    end
  end

  private

  def ticket_type_params
    params.require(:ticket_type).permit(:name, :max_quantity, :price)
  end

end