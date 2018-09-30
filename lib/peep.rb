require 'data_mapper'
require_relative 'database_connect'
require 'pg'

class Peep

include DataMapper::Resource

property :id,           Serial
property :peep,         String
property :created_at,   DateTime

  def self.all
    result = ConnectDatabase.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'])
    end
  end

  def self.create(peep:)
    result = ConnectDatabase.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, created_at;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'] )
  end

end

DataMapper.setup(:default, 'postgres://localhost/chitter')
DataMapper.finalize
DataMapper.auto_upgrade!
