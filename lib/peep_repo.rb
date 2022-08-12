class PeepRepository
  def view_all
    sql = 'SELECT * FROM peeps;'
    DatabaseConnection.exec_params(sql, [])
  end
end
