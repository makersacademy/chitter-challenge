require_relative 'user'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'
require 'pg'
require 'rubygems'

class Peep
  include DataMapper::Resource
  attr_reader :message

  property :id,         Serial
  property :message,    String,   length: 1..280
  property :created_at, DateTime

  belongs_to :users

  def initialize(id:, message:, created_at:)
    @message = message
    @id = id
    @created_at = created_at
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message, created_at) VALUES('#{message}', NOW())")
  end

  def self.view_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], created_at: peep['created_at'])
    end
  end

end
