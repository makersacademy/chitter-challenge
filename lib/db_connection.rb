require 'pg'

class DBConnection

  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.connection
    @connection
  end

  def self.query(sql_string)
    @connection.exec(sql_string)
  end

  def self.insert(table:, columns:, values:)
    value_subs = values.each_with_index.map { |val, ind| "$#{ind + 1}"}
    @connection.prepare('insert_statement', "insert into #{table} (#{columns.join(',')}) values (#{value_subs.join(',')}) returning id, #{columns.join(',')}")
    @connection.exec_prepared('insert_statement', values)
  end


end
