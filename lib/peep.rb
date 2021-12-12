require 'pg'
require_relative './database_connection'

class Peep
  attr_reader :id, :content, :username

  def initialize(id, content, username)
    @id = id
    @content = content
    @username = username
  end

  def self.all
    rs = DatabaseConnection.query('SELECT * FROM peeps')
    rs.map { |peep| Peep.new(peep['id'], peep['content'], peep['username']) }
  end

  def self.create(content, username)
    # if url =~ URI::regexp
    rs = DatabaseConnection.query('INSERT INTO peeps (content, username) VALUES ($1, $2) RETURNING id, content, username;',
                                  [content, username])
    # else
    #   return false
    # end                                 
    # rs is the query object, hence the need to [0] to access the hash containing id, url and title kv pairs
    Peep.new(rs[0]['id'], rs[0]['content'], rs[0]['username'])
  end
end