class PersonMailer < ActionMailer::Base
  def registration_confirmation(person)
    recipients person.email
    from "Makany Webmaster <webmaster@auccentral.com>"
    subject "Welcome to Makany!"
    body :person=>person 
  end

end
