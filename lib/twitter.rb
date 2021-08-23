require_relative './db_connection.rb'

 class Twitter
   attr_reader :name, :username, :time, :text
   def initialize(name, username, time, text)
     @name = name
     @username = username
     @time = time
     @text = text
   end

   def self.get_messages
     result = DatabaseConnection.query("SELECT name, username, text, time FROM users u.name
     JOIN messages m
     ON u.id = m.users_id
     ORDER BY time DESC;")
     result.map { |message| Twitter.new(message['name'], message['username'], message['time'], message['text']) }
   end

   def self.display_messages
     get_messages.map { |message| "#{message.name} | #{message.username} | #{message.time} <br> #{message.text}" }.join("<br><br>")
   end

   def self.create_peep(username, text)
     result = DatabaseConnection.query("SELECT id, name FROM users 
       WHERE username = '#{username}';")
     time = get_time
     DatabaseConnection.query("INSERT INTO
       messages(text, time, users_id)
       VALUES ('#{text}', '#{time}', '#{result[0]['id']}');")
     Twitter.new(result[0]['name'], username, time, text)
   end

   def self.get_time
     Time.now.strftime('%Y-%m-%d %H:%M:%S')
   end

  end