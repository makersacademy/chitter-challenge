require 'pg'
require 'uri'
require './lib/database_connection'
require 'date'
require './app.rb'

class Peep

  attr_reader :peep, :id, :time

  def initialize(peep, id, time)
    @peep = peep
    @id = id
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['peep'], peep['id'], peep['time']) }

  end

  def self.add_new_peep(new_peep, id)
    # raise "You must submit a valid URL." unless working_link?(new_peep)
    # peep = new_peep.sub(/^https?\:\/\/(www.)?/,'')[/[^.]+/].capitalize!
    DatabaseConnection.query("INSERT INTO peeps(id, peep, time) VALUES('#{id}', '#{new_peep}', '#{Time.new.strftime('%d/%m/%Y %H:%M')}')")
  end

end

  # def self.delete(id)
  #   DatabaseConnection.query("DELETE FROM peeps WHERE id = '#{id}'")
  # end

  # def self.update(id, new_link)
  #   raise "You must submit a valid URL." unless working_link?(new_link)
  #   title = new_link.sub(/^https?\:\/\/(www.)?/,'')[/[^.]+/].capitalize!
  #   DatabaseConnection.query("UPDATE links SET title ='#{title}' WHERE id='#{id}'")
  #   DatabaseConnection.query("UPDATE links SET url ='#{new_link}' WHERE id='#{id}'")
  # end
#
#   private
#
#   def self.working_link?(new_link)
#     new_link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
#   end
