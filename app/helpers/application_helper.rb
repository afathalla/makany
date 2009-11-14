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
