# Our app sends notifications. Right now, all types (email, SMS, push) are in one class with many if/else.
# This makes it hard to add new notification types or sending methods.

# Task

# Refactor the notification system using Bridge Pattern.

# Separate notification type (abstraction) from sending method (implementation).

# Add at least 3 sending methods (Email, SMS, Push).

# Make it easy to add new types or methods without changing existing code.

# No if/else in the main notification logic.

class Notification
  def initialize(type)
    @type = type
  end

  def send(message)
    if @type == :email
      puts "Sending Email: #{message}"
    elsif @type == :sms
      puts "Sending SMS: #{message}"
    elsif @type == :push
      puts "Sending Push: #{message}"
    end
  end
end

notif = Notification.new(:email)
notif.send("Hello World")
