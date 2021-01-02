require './lib/db_connection'
require_relative '../models/user'

class Tag
  attr_reader :id, :message_id, :user_id

  def initialize(id, message_id, user_id)
    @id = id
    @message_id = message_id
    @user_id = user_id
  end

  def self.create(message_id, user_id)
    result = DBConnection.query("INSERT INTO tag(message_id, user_id) VALUES(#{message_id}, #{user_id}) RETURNING id, message_id, user_id")
    Tag.new(result[0]['id'], result[0]['message_id'], result[0]['user_id'])
  end

  def self.show_tagged_users(message_id)
    users = []
    result = DBConnection.query("SELECT user_id FROM tag WHERE message_id=#{message_id}")
    result.each do |tag|
     users << tag['user_id']
    end
    users
    # result[0].each do |tag|
    #   DBConnection.query("SELECT username FROM users where id=#{tag[0]}")
    # end
  end

  # def self.all
  #   result = DBConnection.query("SELECT * FROM tag")
  #   result.map do |tag|
  #     Tag.new(tag['id'], tag['message_id'], tag['user_id'])
  #   end
  # end

end