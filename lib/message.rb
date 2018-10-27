require "./lib/databaseconnection.rb"
require "date"

class Message

attr_reader :id, :text, :sender, :sent_time, :response_to

  def self.create(text:, sender:)
    str = "insert into message (message, sender) values ('#{text}','#{sender}') returning id, message, sender, sent_time;"
    result = Databaseconnection.execute(str)
    message = Message.new(id: result[0]["id"], text: result[0]["message"], sender: result[0]["sender"], sent_time: result[0]["sent_time"], response_to: 0)
  end

  # def self.all
  #   result = Databaseconnection.execute('select * from message order by sent_time desc;')
  #   return "No messages" unless result.any?
  #   p "in all YYY #{result}"
  #   result.map do |message|
  #     p "in all 1 #{message}"
  #     Message.new(
  #       id: message['id'],
  #       text: message['message'],
  #       sender: message['sender'],
  #       sent_time: message['sent_time'],
  #       response_to: message['response_to'])
  #   end
  #   p "in all XXX #{result}"
  #   result
  # end

  def self.all
    result = Databaseconnection.execute('select * from message order by sent_time desc;')
    return "No messages" unless result.any?
    resultarr = Array.new
    result.each { |message|
      resultarr.push(Message.new(id: message['id'],text: message['message'],sender: message['sender'],sent_time: message['sent_time'],response_to: message['response_to']))
    }
    resultarr
  end

  def self.update(id:, text:)
    str = "update message set message = '#{text}' where id = '#{id}' returning id, message, sender, sent_time, response_to;"
    result = Databaseconnection.execute(str)
    message = Message.new(id: result[0]["id"], text: result[0]["message"], sender: result[0]["sender"], sent_time: result[0]["sent_time"], response_to: result["response_to"])
    p "in update #{message}"
  end

  def self.reply(text:, sender:, response_to:)
    str = "insert into message (message, sender,response_to) values ('#{text}','#{sender}', '#{response_to}') returning id, message, sender, sent_time, response_to;"
    result = Databaseconnection.execute(str)
    message = Message.new(id: result[0]["id"], text: result[0]["message"], sender: result[0]["sender"], sent_time: result[0]["sent_time"], response_to: result["response_to"])
    p "in reply #{message}"
  end

  def check_for_tags(message)

  end

  def initialize(id:, text:, sender:, sent_time:, response_to: )
    @id = id
    @text = text
    @sender = sender
    @sent_time = Date.parse(sent_time).strftime("%a, %b-%d %H:%M")  #%a, %Y-%m-%d %H:%M:%S
    @response_to = response_to || 0
  end

end
