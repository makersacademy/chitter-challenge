# frozen_string_literal: true

require 'pg'
require './spec/database_helper.rb'
require 'date'
class Chitter

  attr_accessor :content
  def initialize(content)
    @content = content
   # @time = Time.now.strftime("%d/%m/%Y %H:%M")
  end

  def self.all
    
    if ENV['RACK_ENV'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM posts')

    result.map { |row| Chitter.new(row['content']) }
  end

  def self.create(content)
    
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
    result = connection.exec("INSERT INTO posts (content) VALUES ('#{content}') ")
  
   end
end
