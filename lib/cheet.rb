require_relative 'database_connection'
require 'rubygems'
require 'data_mapper'
# require_relative 'database_connection_setup.rb'

DataMapper.setup(:default, 'postgres:///cheeter_test')
DataMapper.finalize


class Cheet

  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :title,      String    # A varchar type string, for short strings
  property :body,       Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.
  DataMapper.finalize

  # def initialize
  #   @title = 'hello'
  # end

end

# def initialize(array)
#   @id = array[0].to_i
#   @url = array[1]
#   @title = array[2]
# end

# def self.all
#   result = DatabaseConnection.query('SELECT * FROM links')
#   result.map { |array| Link.new(array) }
# end
#
# def self.add(new_link, new_title)
#   error_check(new_link)
#   DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{new_link}', '#{new_title}')")
# end
