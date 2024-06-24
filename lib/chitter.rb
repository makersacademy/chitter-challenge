# frozen_string_literal: true

require 'pg'
# Quack class is the ruby object wrapper for the DB data
class Chitter
  attr_reader :id, :message, :display_name, :time_stamp

  def initialize(id:, message:, display_name:, time_stamp:)
    @id = id
    @message = message
    @display_name = display_name
    @time_stamp = time_stamp
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'cheetboard_test')
                 else
                   PG.connect(dbname: 'cheetboard')
                 end

    result = connection.exec('SELECT * FROM cheets;')
    order = result.map do |cheet|
      Chitter.new(id: cheet['id'], message: cheet['message'], display_name: cheet['display_name'],
                time_stamp: cheet['time_stamp'])
    end
    order.reverse
  end

  def self.create(message:, display_name:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'cheetboard_test')
                 else
                   PG.connect(dbname: 'cheetboard')
                 end

    result = connection.exec("INSERT INTO cheets (message, display_name) VALUES('#{message}', '#{display_name}') RETURNING id, message, display_name, time_stamp;")
    Chitter.new(id: result[0]['id'], message: result[0]['message'], display_name: result[0]['display_name'],
              time_stamp: result[0]['time_stamp'])
  end
end
