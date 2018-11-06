require 'pg'
require_relative 'database'

class Cheet

  attr_reader :id, :user, :cheet, :timestamp

  def initialize(id, user, cheet, timestamp)
    @id = id
    @user = user
    @cheet = cheet
    @timestamp = timestamp
  end

  def self.all
    result = Database.query("SELECT * FROM cheets")
    result.map do |row|
      Cheet.new(row['id'], row['username'], row["cheet"], row['timestamp'])
    end
  end

  def self.create(cheet, username)
    Database.query("INSERT INTO cheets (cheet, username)
                    VALUES ('#{cheet}', '#{username}');")
  end

  def self.find_by_id(id)
    rs = Database.query("SELECT * FROM cheets WHERE id = '#{id}'")
    Cheet.new(rs[0]['id'], rs[0]['username'], rs[0]['cheet'], rs[0]['timestamp'])
  end

end
