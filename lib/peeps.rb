require 'pg'
require_relative 'connect_database'
class Peeps

  attr_reader :username, :id, :peep, :date, :loves, :current_user

  def initialize(id,peep,date,username,loves)
    @id = id.to_i
    @peep = peep
    @date = date
    @username = username
    @loves = loves.to_i
  end

  def self.sign_in(current_user, connect_database_class = ConnectDatabase)
    @connection = connect_database_class.start('peep')
    @current_user = current_user
  end

  def self.current_user
    @current_user
  end

  def self.view_all
    sql = "SELECT * FROM peeps ORDER BY date DESC"
    result = @connection.query(sql)
    @results = result.map do |peep|
      Peeps.new(
        peep['id'],
        peep['peep'],
        peep['date'],
        peep['username'],
        peep['loves'])
    end
    @results
  end

  def self.view_by_user(username)
    sql = "SELECT * FROM peeps WHERE username = '#{username}' ORDER BY date DESC"
    result = @connection.query(sql)
    @results = result.map do |peep|
      Peeps.new(
        peep['id'],
        peep['peep'],
        peep['date'],
        peep['username'],
        peep['loves'])
    end
    @results
  end


  def self.add_peep(text,id)
    sql = "INSERT INTO peeps (username,peep) VALUES('#{id}','#{text}');"
    @connection.query(sql)
  end

  def self.loveit(id)
    sql =
    "UPDATE peeps
    SET loves = #{current_loves(id)+1}
    WHERE id = #{id};"
    @connection.query(sql)
  end

  def self.hateit(id)
    sql =
    "UPDATE peeps
    SET loves = #{current_loves(id)-1}
    WHERE id = #{id};"
    @connection.query(sql)
  end

  private

  def self.current_loves(id)
    sql_select =
    "SELECT loves
    FROM peeps
    WHERE id = '#{id}';"
    @connection.query(sql_select)[0]['loves'].to_i
  end

end
