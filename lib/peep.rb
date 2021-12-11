class Peep

  attr_reader :user, :time, :content, :tagged_users

  def initialize(user:, time:, content:, tagged_users:)
    @user = user
    @time = DateTime.parse(time).strftime("%d/%m/%Y %k:%M")
    @content = content
    @tagged_users = tagged_users
  end

  def self.all
    peeps = DatabaseConnection.query(
      "SELECT * 
      FROM Peeps 
      INNER JOIN Users ON Peeps.user_id = Users.id"
    )
    peeps.map do |peep|
      # tagged_users = DatabaseConnection.query(
      #   "SELECT * 
      #   FROM junction_tagged_users 
      #   INNER JOIN Users ON Users.id = junction_tagged_users.user_id 
      #   WHERE junction_tagged_users.peep_id = $1;", 
      #   [peep["id"]]
      # )
      user = User.new(name: peep["name"], username: peep["username"], email: peep["email"])
      Peep.new(user: user, time: peep["time"], content: peep["content"], tagged_users: "TODO")
    end
  end
end
