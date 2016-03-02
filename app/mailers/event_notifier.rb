class EventNotifier < ActionMailer::Base
  default from:     "mailer@ucnext.org",
          reply_to: "no-reply@ucnext.org"

  def notify_invite(invite)
    @invite = invite
    @event = invite.event
    mail(:to => "#{invite.email}", :subject => "Invitation to Event - #{@event.name}").deliver unless Rails.env.staging? and !WHITE_LIST_ARRAY.include? invite.email
  end
end
