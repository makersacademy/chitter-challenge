# task :setup do
#
#   begin
#
#   %w[cheeter cheeter_test].each do |database|
#     connection = PG.connect
#     connection.exec("CREATE DATABASE #{database}")
#     DataMapper.setup(:default, "postgres://#{database}")
#
#     include DataMapper::Resource
#     property :id,         Serial    # An auto-increment integer key
#     property :title,      String    # A varchar type string, for short strings
#     property :body,       Text      # A text block, for longer string data.
#     property :created_at, DateTime  # A DateTime, for any date you might like.
#
#     DataMapper.finalize
#     DataMapper.auto_migrate!
#   end
#   rescue => e
#   end
# end
#
#

require 'pg'
require 'rubygems'
require 'data_mapper'
require File.join(File.dirname(__FILE__), 'lib', 'cheet.rb')

  begin

  DataMapper.setup(:default, 'postgres:///postgres')

  class Cheet
    include DataMapper::Resource

    property :id,         Serial    # An auto-increment integer key
    property :title,      String    # A varchar type string, for short strings
    property :body,       Text      # A text block, for longer string data.
    property :created_at, DateTime  # A DateTime, for any date you might like.
  end

  DataMapper.finalize

  DataMapper.auto_migrate!

  rescue => e
end



require_relative 'database_connection'
require 'rubygems'
require 'data_mapper'

DataMapper.setup(:default, 'postgres://postgres')

class Cheet

    include DataMapper::Resource

    property :id,         Serial    # An auto-increment integer key
    property :title,      String    # A varchar type string, for short strings
    property :body,       Text      # A text block, for longer string data.
    property :created_at, DateTime  # A DateTime, for any date you might like.

  DataMapper.finalize

  DataMapper.auto_migrate!
  #
  # @post = Post.create(
  #   :title      => "My first DataMapper post",
  #   :body       => "A lot of text ...",
  #   :created_at => Time.now
  # )

end
