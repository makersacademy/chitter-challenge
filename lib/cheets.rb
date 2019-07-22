require 'pg'

class Cheets

  attr_reader :message, :time_stamp, :id

  def initialize(id:, message:)
    @time_stamp = Time.new
    @id = id
    @message = message
  end

  def self.create(message:)
  # return false unless is_url?(url)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'cheet_base_test')
  else
    connection = PG.connect(dbname: 'cheet_base')
  end
  result = connection.exec("INSERT INTO chitter (cheet) VALUES('#{message}') RETURNING id, cheet;")
  Cheets.new(id: result[0]['id'], message: result[0]['cheet'])
end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'cheet_base_test')
    else
      connection = PG.connect(dbname: 'cheet_base')
    end
    result = connection.exec("SELECT * FROM chitter")
    result.map { |cheet| cheet['cheet'] }
  end

end
