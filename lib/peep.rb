class Peep

  attr_reader :name, :username, :time, :content, :tagged_users

  def initialize(name:, username:, time:, content:, tagged_users:)
    @name = name
    @username = username
    @time = time
    @content = content
    @tagged_users = tagged_users
  end

  def self.all
    # joining tables together for results
    peeps = DatabaseConnection.query("SELECT * FROM Peeps")
    peeps.map do |peep|
      Peep.new(name: peep[], username:, time:, content:, tagged_users:)
    end
  end
end
