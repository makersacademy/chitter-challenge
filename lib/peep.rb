# frozen_string_literal: true

require 'PG'

class Peep
  attr_reader :id, :message, :created_at

  def initialize(id:, message:, created_at:)
    @id = id
    @message = message
    @created_at = created_at
  end

  def self.all
    result = connection.exec('SELECT * FROM peeps ORDER BY created_at DESC')

    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], created_at: peep['created_at'])
    end
  end

  def self.create(message:)
    result = connection.exec("INSERT INTO peeps (message)
      VALUES('#{message}')
      RETURNING id, message, created_at;")

    Peep.new(id: result[0]['id'], message: result[0]['message'], created_at: result[0]['created_at'])
  end

  def self.connection
    return PG.connect(dbname: 'chitter_test') if ENV['RACK_ENV'] == 'test'

    PG.connect(dbname: 'chitter')
  end
end
