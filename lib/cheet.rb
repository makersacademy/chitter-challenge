require_relative 'database_connection'
require 'rubygems'
require 'data_mapper'

require_relative '../database_connection_setup.rb'

class Cheet

  attr_reader :id, :title, :body, :created_at

  include DataMapper::Resource
  # include DataMapper::Repository
  property :id,         Serial    # An auto-increment integer key
  property :title,      String    # A varchar type string, for short strings
  property :body,       Text, :required => true, :lazy => false      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.
  belongs_to :user
  # DataMapper.finalize

  def self.add_cheet(title, body)
    Cheet.create(
      :title      => title,
      :body       => body,
      :created_at => Time.now
    )
  end

  def self.reverse_chronological_cheets
    Cheet.all(:order => [:created_at.desc])
  end


end

# DataMapper.setup(:default, 'postgres:///cheeter_test')
#
#   a = Cheet.all
#   p a

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
