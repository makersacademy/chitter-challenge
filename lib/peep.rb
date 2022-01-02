require_relative './database_connection.rb'

class Peep

  attr_reader :id, :user_id, :body, :create_time

  def initialize(response_data)
    ## Init method casts a PG::Response object hash values to attributes of a Peep instance
    @id = response_data["id"].to_i
    @user_id = response_data["user_id"].to_i
    @body = response_data["body"]
    @create_time = response_data["create_time"]
  end

  def self.post(user_id, body)
    ## Method inserts a new entry into the peeps table, 
    ## fields "id" and "create_time" are generated automatically by postgres
    ## returns an instance of Peep
    new_peep = DatabaseConnection.query(
      "INSERT INTO peeps (user_id, body) VALUES ($1, $2)
      RETURNING id, user_id, body, create_time;",
      [user_id, body]
    )
    return Peep.new(new_peep.first)
  end

  def self.all()
    ## returns an array of Peep instances in descending order of create time attribute
    results = DatabaseConnection.query("SELECT * FROM peeps ORDER BY create_time DESC;")
    peep_arr = results.map { |result|
      Peep.new(result)
    }
  end

  ## TODO: def method that returns the Username of the peep author

end