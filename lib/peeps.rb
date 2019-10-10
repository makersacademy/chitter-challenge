require 'pg'
class Peeps

  attr_reader :username, :id, :peep, :date, :loves

  def initialize(id,peep,date,username,loves)
    @id = id
    @peep = peep
    @date = date
    @username = username
    @loves = loves
  end

  def self.sign_in(username)
    @username = username
  end

  def self.username
    @username
  end

  def self.view_all
    connection = which_connection
    result = connection.exec("SELECT * FROM peeps ORDER BY date DESC")
    @results = result.map do |peep|
      Peeps.new(peep['id'],peep['peep'],peep['date'],peep['username'],peep['loves'])
    end
    @results
  end

  def self.add_peep(text)
    connection = which_connection
    connection.exec("INSERT INTO peeps (username,peep) VALUES('#{@username}','#{text}');")
  end

  def self.loveit(id)
    connection = which_connection
    current_loves = connection.exec(
      "SELECT loves
      FROM peeps
      WHERE id = '#{id}';")[0]['loves'].to_i
      current_loves+=1
    connection.exec(
      "UPDATE peeps
      SET loves = #{current_loves}
      WHERE id = #{id};")
  end

  def self.hateit(id)
    connection = which_connection
    current_loves = connection.exec(
      "SELECT loves
      FROM peeps
      WHERE id = '#{id}';")[0]['loves'].to_i
      current_loves-=1
    connection.exec(
      "UPDATE peeps
      SET loves = #{current_loves}
      WHERE id = #{id};")
  end

  private

  def self.which_connection
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect(dbname: 'test_chitter_database')
    else
      return PG.connect(dbname: 'chitter_database')
    end
  end

end
