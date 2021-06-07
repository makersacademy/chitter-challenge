require 'pg'
require_relative 'database_connection'
require_relative 'users'

class Shouter
  ANON = ['AnonymousAardvark', 'InvisibleIguana', 'CamouflagedChameleon', 'HiddenHyena']

  def self.setup
    @@database = database_connect
  end

  def self.all
    result = []
    output = @@database.query("SELECT * FROM shouts")
    output.map do |shout|
      shout['username'] = Users.get_username(shout['user_id'])
      shout['username'] = ANON.sample if shout['username'] == 'anon'
      shout['replies'] = replies(shout['shout_id'])
      result.unshift(shout)
    end
    result
  end

  def self.shout(shout_content, author)
    time_shouted = Time.now.strftime("%e %b, %y | %k:%M")
    @@database.query("INSERT INTO shouts (user_id, time_shouted, shout_content)
    VALUES('#{user_id(author)}', '#{time_shouted}','#{shout_content}') RETURNING shout_content;")
  end

  def self.find(shout_id)
    result = []
    output = @@database.query("SELECT * FROM shouts WHERE shout_id='#{shout_id}'")
    output.map do |shout|
      shout['username'] = Users.get_username(shout['user_id'])
      shout['username'] = ANON.sample if shout['username'] == 'anon'
      result.unshift(shout)
    end
    result
  end

  def self.reply(reply_content, shout_id, author)
    time_replied = Time.now.strftime("%e %b, %y | %k:%M")
    @@database.query("INSERT INTO replies (shout_id, user_id, time_replied, reply_content)
    VALUES('#{shout_id}', '#{user_id(author)}', '#{time_replied}','#{reply_content}')
    RETURNING reply_content;")
  end

  def self.replies(shout_id)
    result = []
    output = @@database.query("SELECT * FROM replies WHERE shout_id='#{shout_id}'")
    output.map do |shout|
      shout['username'] = Users.get_username(shout['user_id'])
      shout['username'] = ANON.sample if shout['username'] == 'anon'
      result.unshift(shout)
    end
    result
  end

  def self.database_connect
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('shouter_database_test')
    else
      DatabaseConnection.setup('shouter_database')
    end
  end

  def self.user_id(author)
    return 99 if author.nil?

    @@database.query("SELECT user_id FROM users WHERE username='#{author}'").first['user_id']
  end
end
