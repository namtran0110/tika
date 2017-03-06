class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :mine]

  def index
    search = params[:term].present? ? params[:term] : nil
    @events = if search
               Event.upcoming.search(search)
              else
                Event.upcoming
              end
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @category = Category.all
    @event = Event.new
  end

  def edit
    @category = Category.all
    @venue = Venue.all
  end

  def create
    @venue = Venue.create(venue_params)
    @event = @venue.events.create(event_params)
    @event.user_id = current_user.id
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def mine
    load_user
    @events = @user.events
  end

  def load_user
    if params[:user_id]
      @user = User.find params[:user_id]
    else
      @user = current_user
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :starts_at, :ends_at, :venue_id, :hero_image_url, :extended_html_description, :category_id, :publish)
  end

  def venue_params
    params.require(:venue).permit(:name, :full_address)
  end

end
