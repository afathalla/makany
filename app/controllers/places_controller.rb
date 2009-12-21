class PlacesController < ApplicationController
  include Geokit::Geocoders #Include Geocoders to use Google Maps
  before_filter :require_person


  # GET /places
  # GET /places.xml
  def index
    @places = Place.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

  # GET /places/1
  # GET /places/1.xml
  def show
    @place = Place.find(params[:id])
    if (!@place.zip_code.nil?)
    @loc=MultiGeocoder.geocode(@place.address << ' '<< @place.zip_code)
    else
    @loc=MultiGeocoder.geocode(@place.address)
    end
    @map=GMap.new("map_div")
    @map.control_init(:large_map=>true,:map_type=>true)
    @map.center_zoom_init([@loc.lat,@loc.lng],10)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/new
  # GET /places/new.xml
  def new
    @place = Place.new
#    @place.people.create(:person_id)
#    @place.people<<(Person.find(params[:person_id]) unless (params[:person_id].nil?))
#    @place.people<<(Person.find(params[:person_id]))

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }


    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.xml
  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        flash[:notice] = 'Place was successfully created.'
        format.html { redirect_to(@place) }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])
 
    
    
    respond_to do |format|
      if @place.update_attributes(params[:place])
        flash[:notice] = 'Place was successfully updated.'
        format.html { redirect_to(@place) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end
end
