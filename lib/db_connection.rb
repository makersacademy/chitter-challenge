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
    @connection.prepare('insert_statement', prepare_sql_insert_string(table, columns, values))
    results = @connection.exec_prepared('insert_statement', values)
    DBConnection.query('DEALLOCATE insert_statement')
    results
  end

  def self.select_safe(table:, column:, value:)
    @connection.prepare('select_statement', prepare_sql_select_string(table, column))
    results = @connection.exec_prepared('select_statement', [value])
    DBConnection.query('DEALLOCATE select_statement')
    results
  end

  def self.prepare_sql_insert_string(table, columns, values)
    value_subs = values.each_with_index.map { |val, ind| "$#{ind + 1}"}.join(',')
    columns_string = columns.join(',')
    return_columns = columns.unshift('id').join(',')
    "insert into #{table} (#{columns_string}) values (#{value_subs}) returning #{return_columns}"
  end

  def self.prepare_sql_select_string(table, column)
    "select * from #{table} where #{column} = $1"
  end

  private_class_method :prepare_sql_insert_string, :prepare_sql_select_string
end
