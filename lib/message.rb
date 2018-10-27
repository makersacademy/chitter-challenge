require "./lib/databaseconnection.rb"
require "date"

class Message

attr_reader :id, :text, :sender, :sent_time, :response_to

  def self.create(text:, sender:)
    str = "insert into message (message, sender) values ('#{text}','#{sender}') returning id, message, sender, sent_time;"
    result = Databaseconnection.execute(str)
    message = Message.new(id: result[0]["id"], text: result[0]["message"], sender: result[0]["sender"], sent_time: result[0]["sent_time"], response_to: "")
  end

  # def self.all
  #   result = Databaseconnection.execute('select * from message order by sent_time desc;')
  #   return "No messages" unless result.any?
  #   result.map do |message|
  #     Message.new(
  #       id: message['id'],
  #       text: message['message'],
  #       sender: message['sender'],
  #       sent_time: message['sent_time'],
  #       response_to: message['response_to'])
  #   end
  #   result
  # end

  def self.all
    result = Databaseconnection.execute('select * from message, chitter_user where message.sender = chitter_user.user_id order by sent_time desc;')
    return "No messages" unless result.any?
    resultarr = Array.new
    result.each { |message|
      resultarr.push(Message.new(id: message['id'],text: message['message'],sender: message['name'],sent_time: message['sent_time'],response_to: message['response_to']))
    }
    resultarr
  end

  def self.find(id:)
    result = Databaseconnection.execute("select * from message, chitter_user where message.sender = chitter_user.user_id and id = '#{id}' order by sent_time desc;")
    return "No messages" unless result.any?
    message = Message.new(id: result[0]["id"], text: result[0]["message"], sender: result[0]["sender"], sent_time: result[0]["sent_time"], response_to: result[0]["response_to"])
  end

  def self.update(id:, text:, sender:)
    str = "update message set message = '#{text}' where id = '#{id}' returning id, message, sender, sent_time, response_to;"
    result = Databaseconnection.execute(str)
    message = Message.new(id: result[0]["id"], text: result[0]["message"], sender: result[0]["sender"], sent_time: result[0]["sent_time"], response_to: result[0]["response_to"])
    message
  end

  def self.reply(text:, sender:, response_to:)
    str = "insert into message (message, sender,response_to) values ('#{text}','#{sender}', '#{response_to}') returning id, message, sender, sent_time, response_to;"
    result = Databaseconnection.execute(str)
    message = Message.new(id: result[0]["id"], text: result[0]["message"], sender: result[0]["sender"], sent_time: result[0]["sent_time"], response_to: result[0]["response_to"])
  end

  def self.delete(id:)
    Databaseconnection.execute("delete from message where response_to = '#{id}';")
    Databaseconnection.execute("delete from message where id = '#{id}';")
  end

  def self.check_for_tags(message)
   words = message.split(" ")
   users = Array.new
   words.each { |word|
     users.push(word[1..-1]) if word[0] == "@"
   }
   #p users
   users
  end

  def initialize(id:, text:, sender:, sent_time:, response_to: )
    @id = id
    @text = text
    @sender = sender
    @sent_time = Date.parse(sent_time).strftime("%a, %b-%d %H:%M:%S")  #%a, %Y-%m-%d %H:%M:%S
    #@sent_time = Date.parse(sent_time).to_formatted_s(:long_ordinal)
    @response_to = (response_to || 0).to_i
  end

end
