class AccessDatabase

  # Gets all data from the selected table in the database and
  # returns as nested array:

  def self.get_all(table)
    output = DatabaseConnection.query("SELECT * FROM #{table}")
    output.map { |line| line }
  end

  # Takes a table and line number and returns that line of the selected table
  # in the database, in a nested array:

  def self.get_line(table, line)
    output = DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{line}';")
    output.map { |line| line }
  end

end
