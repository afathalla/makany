# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

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


#java_import "com.ekahau.engine.sdk.Device"
#java_import com.ekahau.common.sdk.EConnection
#java_import com.ekahau.common.sdk.EException
#java_import com.ekahau.common.sdk.EMsg
#java_import com.ekahau.common.sdk.EResponse
#java_import com.ekahau.engine.sdk.Device
#java_import com.ekahau.engine.sdk.EngineException
#java_import com.ekahau.engine.sdk.PositioningEngine
#java_import com.ekahau.engine.sdk.event.AbstractEngineEventListener
#java_import com.ekahau.engine.sdk.event.LocationEstimate
#java_import com.ekahau.engine.sdk.event.ScanEvent
#java_import com.ekahau.engine.sdk.event.ZoneEvent

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include ApplicationHelper

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '2a4d5bd3ed0489dc0d98cc8757135dec'

  def require_person
      unless current_person
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_person_session_url
        return false
      end
    end
 
    def require_no_person
      if current_person
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_url # fix root_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def initalize_ekahau_engine
     if @m_engine.nil?
       #Create objects needed for the communication with EPE.
       @m_engine = EkahauEngineSDK::PositioningEngine.new(
          "10.20.16.68",8550,"admin", "admin");
        @m_engine_connection = EkahauCommonSDK::EConnection.new("10.20.16.84", 8550);

      @m_engine_connection.setUserCredentials("admin","admin");
      end
    end

end
