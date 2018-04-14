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

end
