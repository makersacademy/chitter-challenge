class DatabaseConnection
  def self.setup(db)
    PG.connect(dbname: "#{db}")
  end
end
