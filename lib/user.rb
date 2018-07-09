require 'pg'

class User
  attr_reader :id, :first_name, :last_name, :date

  def initialize(id, first_name, last_name, date)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @date = date
  end

  def self.create(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    # We are RETURNING the ID, first name, last name and date from the User we
    # just inserted into the database and then wrapping it to a User instance

    result = connection.exec("INSERT INTO users (first_name, last_name, date) VALUES('#{params[:first_name]}', '#{params[:last_name]}',
    '#{params[:date]}') RETURNING id, first_name, last_name, date")
    User.new(result.first['id'], result.first['first_name'],
      result.first['last_name'], result.first['date'])
  end

  def ==(other)
    @id == other.id
  end
end
