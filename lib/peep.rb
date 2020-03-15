class Peep

  def self.create(peep:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, user_id) VALUES('#{peep}', '#{user_id}') RETURNING id, peep, date;")
    user = User.find(user_id)
    Peep.new(
      id: result[0]['id'],
      peep: result[0]['peep'],
      date: result[0]['date'],
      user_name: user.name
    )
    # does the Peep instance need to reference the user_id? or do I create a user instance?
  end

  def self.all()
    # might be good to update this query to a join and get the username
    result = DatabaseConnection.query("SELECT p.id, p.peep, p.date, u.name user_name FROM peeps p LEFT JOIN users u ON p.user_id = u.id ORDER BY p.date desc;")
# SELECT p.id, p.peep, p.date, u.name user_name FROM peeps p LEFT JOIN users u ON p.user_id = u.id ORDER BY p.date desc;
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        peep: peep['peep'],
        date: peep['date'],
        user_name: peep['user_name']
      )
    end
  end

  attr_reader :id, :peep, :date, :user_name

  def initialize(id:, peep:, date:, user_name:)
    @id = id
    @peep = peep
    @date = date
    @user_name = user_name
  end

end
