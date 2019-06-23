require 'pg'

class OtherUsers

  def self.all
    connect_to_database= PG.connect(dbname: "fakepeeps")
    pull_out_data=connect_to_database.exec("SELECT (text, username) FROM fp;")
  end
end
