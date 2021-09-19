class ChitterFeed
  def self.all
    connection = PG.connect(dbname: 'chitter_app')
    result = connection.exec('SELECT * FROM chitter;')
    result.map { |post| post['peep'] }
  end
end
