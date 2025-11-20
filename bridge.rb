class SenderInterface
  def send(message)
    raise NotImplementedError, "Subclass must implement '#{__method__}'"
  end
end

class EmailSender < SenderInterface
  def send(message)
    puts "Sending Email: #{message}"
  end
end

class SMSSender < SenderInterface
  def send(message)
    puts "Sending SMS: #{message}"
  end
end

class PushSender < SenderInterface
  def send(message)
    puts "Sending Push: #{message}"
  end
end

class Notification
  def initialize(notification_sender)
    @notification_sender = notification_sender
  end

  def send(message)
    @notification_sender.send(message)
  end
end

email_sender = EmailSender.new
email_notification = Notification.new(email_sender)
email_notification.send('Hello World')

sms_sender = SMSSender.new
sms_notification = Notification.new(sms_sender)
sms_notification.send('Hello World')

push_sender = PushSender.new
push_notification = Notification.new(push_sender)
push_notification.send('Hello World')
