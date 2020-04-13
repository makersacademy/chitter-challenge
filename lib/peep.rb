require 'pg'

class Peep
  attr_reader :message, :peep_id, :time, :user

  def initialize(text:, time: Time.now.utc, id:, peeper:, tagged:)
    @message = text
    @peep_id = id
    @time = time
    @user = peeper
    @tagged_users = tagged
  end

  def self.all
    self.connect
    rs = @con.exec "SELECT * FROM peeps ORDER BY id DESC"
    rs.map { |row| Peep.new(text: row['text'], time: row['time'], id: row['id'], peeper: self.username(row['user_id']), tagged: self.tagged_users(row['id'])) }       
  end

  def self.tagged_users(peep_tag)
    self.connect
    rs = @con.exec("SELECT * FROM tags WHERE peep_id = '#{peep_tag}'")
    usernames = []
    rs.each { |tag| 
      interim = @con.exec("SELECT * FROM users where id = '#{tag['user_id']}'") 
      interim.map{|user| usernames.push(user['username']) }
    }
  end

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      @con = PG.connect :dbname => 'chitter_test', :user => 'edwardphillips'
    else 
      @con = PG.connect :dbname => 'chitter', :user => 'edwardphillips'
    end
  end

  def self.create(text:, user:, tags: "")
    self.connect
    message = text.split("'")
    body = message.join("''")
    if user.is_a? Array
      user = user[0]
    end
    result = @con.exec("INSERT INTO peeps(text,user_id, time) VALUES ('#{body}', '#{user}', '#{Time.now.utc}') RETURNING id;")
    tags = tags.split(",").map{|tag| tag.strip}
    names =[]
    tags.each{ |tag|
      names.push(self.userid(tag))
    }
    if names.any?
      names.each {|name| @con.exec("INSERT INTO tags (peep_id, user_id) VALUES ('#{result[0]['id']}','#{name}');")}
    end
    end

  def self.username(userid)
    self.connect
    person = @con.exec("SELECT * FROM users WHERE id = '#{userid}'")
    if person.any?
      person.map{|user| user['username']}
    end
  end

  def self.userid(username)
    self.connect
    person = @con.exec("SELECT * FROM users WHERE username = '#{username}'")
    if person.any?
      person.map{|user| user['id']}
    end
  end
end