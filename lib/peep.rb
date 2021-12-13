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
      tagged_users = DatabaseConnection.query(
        "SELECT Users.id
        FROM junction_tagged_users 
        INNER JOIN Users ON Users.id = junction_tagged_users.user_id 
        WHERE junction_tagged_users.peep_id = $1;", 
        [peep["id"]]
      )
      tags_array = []
      unless tagged_users.num_tuples.zero?
        tagged_users.each do |tagged_user|
          array << tagged_user['user_id']
        end
      end
      user = User.new(name: peep["name"], username: peep["username"], email: peep["email"])
      Peep.new(user: user, time: peep["time"], content: peep["content"], tagged_users: tags_array)
    end
  end
end
