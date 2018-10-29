require "./lib/user.rb"
require "./lib/databaseconnection.rb"


class Communicationmanager

  def self.send_email(text:,recepients:, sender:)
    userarr = User.find(users: recepients)
    return "No users" if !userarr.is_a? Array
    emailarr = Array.new
    userarr.each {|user|
      str = "insert into email (text, sender, receiver) values ('#{sender}','#{text}','#{user.name}') returning text, sender, receiver;"
      email = Databaseconnection.execute(str)
      emailarr.push(Email.new(text: email[0]["text"],sender: email[0]["sender"],receiver: email[0]["receiver"]))
    }
    emailarr
  end

  def self.fetch_all_emails
    result = Databaseconnection.execute("select * from email")
    return "No emails" unless result.any?
    emailarr = Array.new
    result.each{ |email| emailarr.push(Email.new(text: email["text"],sender: email["sender"],receiver: email["receiver"]))} if result
    emailarr
  end

end

class Email
  def initialize(text:,sender:,receiver:)
    @text = text
    @sender = sender
    @receiver =receiver
  end
end
