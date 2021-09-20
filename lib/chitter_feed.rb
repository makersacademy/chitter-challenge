class ChitterFeed
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else 
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec('SELECT * FROM chitter;')
    result.map { |post| post['peep'] }
  end
end
