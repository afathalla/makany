require 'java' #Using Java fot Ekahau Integration
require File.join(File.dirname(__FILE__), '../../lib/ekahau-engine-sdk-new.jar')
require File.join(File.dirname(__FILE__), '../../lib/commons-codec-1.3.jar')
require File.join(File.dirname(__FILE__), '../../lib/commons-httpclient-3.1.jar')
require File.join(File.dirname(__FILE__), '../../lib/commons-logging-1.1.jar')
require File.join(File.dirname(__FILE__), '../../lib/log4j-1.2.14.jar')
require File.join(File.dirname(__FILE__), '../../lib/servlet-2.4.jar')

#TODO:remove unneeded imports
java_import java.io.BufferedReader
java_import java.io.IOException
java_import java.io.InputStreamReader
java_import java.util.List

#Importing Ekahau Java SDK classes
#TODO:remove unneeded imports
module EkahauCommonSDK
include_package "com.ekahau.common.sdk"
end
module EkahauEngineSDK
include_package "com.ekahau.engine.sdk"
end
module EkahauEngineSDKEvent
include_package "com.ekahau.engine.sdk.event"
end
module EkahauEngineSDKExamples
include_package "com.ekahau.engine.sdk.examples"
end
module EkahauEngineSDKImpl
include_package "com.ekahau.engine.sdk.impl"
end
module EkahauEngineSDKSensor
include_package "com.ekahau.engine.sdk.sensor"
end
class PeopleController < ApplicationController
  before_filter :require_person, :except=> [:new,:create]
  before_filter :initalize_ekahau_engine

  # GET /people
  # GET /people.xml
  def index
    @people = Person.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # GET /people/1
  # GET /people/1.xml
  # Do some changes to show so that we can display a friend feed on homepage
  # Ekahau SDK calls can be used find friend locations
  def show
    @person = Person.find(params[:id])
    #@person_places=Person.person_places

    #Create new Ekahau EventListener
    unless @m_engine.nil?
#    @event_listener = EventListener.new
#		@m_engine.addEventListener(@event_listener, nil, "ANY_RULE_LABEL", false);
#		@m_engine.startTracking();

   @event_history = @m_engine.getEventHistory(nil,"user" , nil,nil, nil, nil, nil, "3d",nil , 10)
#    for event in @event_history
#      event.type=EkahauEngineSDKEvent::ZoneEvent
#    end
    end

#		mEngine.stopTracking();
#		mEngine.removeAllListeners()

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/manage_friends
  # GET /people/1/manage_friends.xml
  def manage_friends
    @person=current_person

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/new
  # GET /people/new.xml
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
    #@person = Person.find(params[:id])
     @person=current_person
  end

  # POST /people
  # POST /people.xml
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        PersonMailer.deliver_registration_confirmation(@person)
        flash[:notice] = 'Registration Successful.'
        format.html { redirect_to(@person) }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    params[:person][:place_ids] ||= []
   # @person = Person.find(params[:id])
     @person=current_person

    respond_to do |format|
      if @person.update_attributes(params[:person])
        flash[:notice] = 'Thank you for updating your information.'
        format.html { redirect_to(@person) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(people_url) }
      format.xml  { head :ok }
    end
  end

end
