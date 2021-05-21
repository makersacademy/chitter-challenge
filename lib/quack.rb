# frozen_string_literal: true

require 'pg'
# Quack class is the ruby object wrapper for the DB data
class Quack
  attr_reader :id, :message, :display_name, :time_stamp

  def initialize(id:, message:, display_name:, time_stamp:)
    @id = id
    @message = message
    @display_name = display_name
    @time_stamp = time_stamp
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'duckboard_test')
                 else
                   PG.connect(dbname: 'duckboard')
                 end

    result = connection.exec('SELECT * FROM quacks;')
    result.map do |quack|
      Quack.new(id: quack['id'], message: quack['message'], display_name: quack['display_name'],
                time_stamp: quack['time_stamp'])
    end
  end
end
