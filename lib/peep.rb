# frozen_string_literal: true

require 'pg'
require './lib/database_connection'

class Peep
  attr_reader :id, :message, :created_on

  def initialize(id:, message:, created_on:)
    @id = id
    @message = message
    @created_on = created_on
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_on DESC")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], created_on: peep['created_on'])
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, created_on;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], created_on: result[0]['created_on'])
  end

end
