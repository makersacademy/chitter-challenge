require 'pg'

class Message
  attr_reader :id, :message
  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect( user: 'gregpaul', dbname: 'message_list_test' )
    else
      connection = PG.connect( user: 'gregpaul', dbname: 'message_list' )
    end
    result = connection.exec( "SELECT * FROM messages;" )
    result.map { |message| Message.new(id: message['id'], message: message['message'])}
    # p list
    # separated_list = list.map { |separated| separated}
    # list = result.map { |bookmark| Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])}
  end

    def self.create(message:)
      if ENV['RACK_ENV'] == 'test'
        connection = PG.connect( user: 'gregpaul', dbname: 'message_list_test' )
      else
        connection = PG.connect( user: 'gregpaul', dbname: 'message_list' )
      end
    result = connection.exec( "INSERT INTO messages (message) VALUES ('#{message}')")
    end
  end
