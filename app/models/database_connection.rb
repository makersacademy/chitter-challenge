class DatabaseConnection

  def self.add_details(dbname:, user:, dbms:)
    @dbname = self.database_type(dbname)
    @user = user
    @dbms = dbms
  end

  def self.command(sql_query)
    con = @dbms.connect(:dbname => @dbname, :user => @user)
    response = []
    begin
      response[0] = (con.exec(sql_query))
    rescue => e
      response[1] = e.message
    ensure
      con.close
    end
    response
  end

  private

  def self.database_type(dbname)
    ENV['ENVIRONMENT'] == 'test' ? dbname + '-test' : dbname
  end
end
