require 'pg'
require_relative '../spec/web_helpers.rb'

class Peep

  attr_reader :id, :content, :timestamp, :user

  def initialize(id, content, author, timestamp = Time.now)
    @id = id
    @content = content
    @author = author
    @timestamp = timestamp
  end

  def self.create(content, author, timestamp = Time.now)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "peep_manager_test")
    else
      connection = PG.connect(dbname: "peep_manager")
    end
  
    result = connection.exec("INSERT INTO peeps (content, author, timestamp) VALUES ('#{content}', '#{author}', '#{timestamp}') RETURNING id, content, author, timestamp;")

    Peep.new(result[0]["id"], result[0]["content"], result[0]["author"], result[0]["timestamp"])
  end
end