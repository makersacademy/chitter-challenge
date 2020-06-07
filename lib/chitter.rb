# frozen_string_literal: true

require 'pg'
require './spec/database_helper.rb'
require 'date'
class Chitter

  attr_accessor :content , :time
  def initialize(content, time)
    @content = content
    @time = time.chomp(':00')
  end

  def self.all
    
    if ENV['RACK_ENV'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM posts ORDER BY time DESC ')

    result.map { |row| Chitter.new(row['content'], row['time']) }
  end

  def self.create(content)
    
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
    time_stamp = Time.now.strftime(" %H:%M")
    result = connection.exec("INSERT INTO posts (content, time) VALUES ('#{content}' , '#{time_stamp}') ")
  
   end
end
