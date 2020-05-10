require 'pg'
require_relative 'maker_profile'

class MakerPeep

  attr_reader :peep, :username, :datetime, :name, :email

  def initialize(id:, peep:, datetime:, username:)
    @id = id
    @peep = peep
    @datetime = datetime
    @username = username
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peep|
      MakerPeep.new(id: peep['id'], peep: peep['peep'], datetime: peep['datetime'],
       username: peep['username'])
    end
  end

  def self.create(peep:, username:, datetime:)
    time = Time.new
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (peep, datetime, username) VALUES
    ('#{peep}', '#{time.strftime("%d/%m/%Y, %k:%M")}', '#{username}') RETURNING id,
    username, peep, datetime;")
    MakerPeep.new(id: result[0]['id'], peep: result[0]['peep'], datetime: result[0]['datetime'],
    username: result[0]['username'])
  end
end
