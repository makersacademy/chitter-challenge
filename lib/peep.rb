class Peep

  def self.create(peep:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, user_id) VALUES('#{peep}', '#{user_id}') RETURNING id, peep, date;")
    Peep.new(
      id: result[0]['id'],
      peep: result[0]['peep'],
      date: result[0]['date']
    )
    # does the Peep instance need to reference the user_id? or do I create a user instance?
  end

  def self.all()
    # might be good to update this query to a join and get the username
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY date desc;")

    result.map do |peep|
      Peep.new(
        id: peep['id'],
        peep: peep['peep'],
        date: peep['date']
      )
    end
  end

  attr_reader :id, :peep, :date # :user_name

  def initialize(id:, peep:, date:)
    @id = id
    @peep = peep
    @date = date
    # @user_name = user_name
  end

end
