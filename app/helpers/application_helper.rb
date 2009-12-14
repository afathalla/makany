#require 'java' #Using Java fot Ekahau Integration
#
#TODO:remove unneeded imports
#java_import java.io.BufferedReader
#java_import java.io.IOException
#java_import java.io.InputStreamReader
#java_import java.util.List
#
#Importing Ekahau Java SDK classes
#TODO:remove unneeded imports
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

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  private
 def current_person_session
   return @current_person_session if defined?(@current_person_session)
   @current_person_session = PersonSession.find
 end

 def current_person
   @current_person = current_person_session && current_person_session.record
 end

end

