require 'pg'
require_relative './database.rb'

class Peep

  attr_reader :id, :username, :message, :time

  def initialize(options)
    @id = options[:id]
    @username = options[:username]
    @message = options[:message]
    @time = options[:time]
  end

  def self.create(options)
    con = Database::connect
    con.exec "INSERT INTO peeps (username, message, time) VALUES ('#{options[:username]}', '#{options[:message]}', '#{current_time}')"
  end

  def self.all
    con = Database::connect
    con.exec('SELECT * FROM peeps').map do |peep|
      Peep.new(
        id: peep['id'],
        username: peep['username'],
        message: peep['message'],
        time: peep['time'])
    end
  end

  private

  def self.current_time
    Time.now.strftime "%H:%M:%S | %a | %d-%b-%y"
  end


end
