require 'pg'

class Users

  def self.all
    @peeps = []
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test' )
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM messages ORDER BY time DESC")
    # result.map do |messages| messages['content']
    result.map { |messages|
      @peeps << {:id => "#{messages['id']}", :content => "#{messages['content']}",
      :time => "#{messages['time']}" } }
      @peeps
  end

end
