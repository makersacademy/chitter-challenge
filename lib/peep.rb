require "./lib/select_database"
require "./lib/database_connection"

class Peep 

  attr_reader :id, :body, :posted_at, :author

  def initialize(id, body, date, user_id)
    @id = id
    @body = body
    @posted_at = date
    @user_id = user_id
    @author = find_author
  end

  def self.all
    select_database

    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")

    peeps.map do |peep|
      Peep.new(peep["id"], peep["body"], peep["posted_at"], peep["user_id"])
    end
  end

  def self.add(peep, user_id)
    select_database

    result = DatabaseConnection.query(
                              "INSERT INTO peeps (body, user_id) 
                              VALUES ('#{peep}', '#{user_id}') 
                              RETURNING id, body, posted_at, user_id;"
                            )
    Peep.new(result[0]["id"], result[0]["body"], result[0]["posted_at"], result[0]["user_id"])
  end

  def find_author 
    select_database

    result = DatabaseConnection.query("SELECT username FROM users WHERE id = '#{@user_id}';")

    author = result[0]["username"]
  end

end
