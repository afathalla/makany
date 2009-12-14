#Implementing EventListener Java Interface for Ekahau Integration

require 'java' #Using Java fot Ekahau Integration

#TODO:remove unneeded imports
java_import java.io.BufferedReader
java_import java.io.IOException
java_import java.io.InputStreamReader
java_import java.util.List

#Importing Ekahau Java SDK classes
#TODO:remove unneeded imports
java_import com.ekahau.common.sdk.EConnection
java_import com.ekahau.common.sdk.EException
java_import com.ekahau.common.sdk.EMsg
java_import com.ekahau.common.sdk.EResponse
java_import com.ekahau.engine.sdk.Device
java_import com.ekahau.engine.sdk.EngineException
java_import com.ekahau.engine.sdk.PositioningEngine
java_import com.ekahau.engine.sdk.event.AbstractEngineEventListener
java_import com.ekahau.engine.sdk.event.LocationEstimate
java_import com.ekahau.engine.sdk.event.ScanEvent
java_import com.ekahau.engine.sdk.event.ZoneEvent

class EventListener < AbstractEngineEventListener
  def newZoneEnteredEvent
        @zone_event=pEvent
        @device=pDevice;
        @location_estimate=pLocation
        @msg="New Zone Entered" << pEvent.to_str
  end

  def msg
    @msg
  end
end