class PersonMailer < ActionMailer::Base
  def registration_confirmation(person)
    recipients person.email
    from "Makany <webmaster@auccentral.com>"
    subject "Welcome to Makany!"
    body :person=>person 
  end

  def friend_invitation (sent_invitation)
    recipients sent_invitation.receiver.email
    from "Makany <webmaster@auccentral.com>"
    subject sent_invitation.sender.full_name << " wants to be your friend"
    body :sent_invitation=>sent_invitation,:profile_url=>person_url(sent_invitation.sender,:host=>'www.auccentral.com')
  end

  def friend_invitation_accepted (friendship)
    recipients friendship.friend.email
    from "Makany <webmaster@auccentral.com>"
    subject friendship.person.full_name << " is now your friend on Makany"
    body :friendship=>friendship, :profile_url=>person_url(friendship.friend,:host=>'www.auccentral.com')
  end

end
