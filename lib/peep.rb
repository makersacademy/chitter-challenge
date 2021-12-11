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
    peeps = DatabaseConnection.query("SELECT * FROM Peeps INNER JOIN Users ON Peeps.user_id = Users.id")
    p peeps[0]
    peeps.map do |peep|
      Peep.new(name: peep["name"], username: peep["username"], time: peep["time"], content: peep["content"], tagged_users: "TODO")
    end
  end
end
