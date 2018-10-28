require 'pg'
require_relative 'boot_up_connection'

class Cheet
  attr_reader :id, :text, :timestamp, :username

  def initialize(id, text, timestamp, username)
    @id = id
    @text = text
    @timestamp = timestamp
    @username = username

  end

  def self.all
    list = Connection.query('SELECT * from cheets ORDER BY timestamp DESC;').map do |cheet|
      Cheet.new(cheet['id'].to_i, cheet['cheet'], cheet['timestamp'], cheet['username'])
    end
    return list
  end

  def self.create(text, username = 'Anonymous')
    Connection.query("INSERT INTO cheets(cheet, timestamp, username) VALUES('#{text}', '#{Time.now}', '#{username}');")
  end
end
