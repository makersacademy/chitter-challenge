module PeepHelper
  def peep_username(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [id])
    user = User.new(id: result[0]["id"], username: result[0]["username"], email: result[0]["email"], name: result[0]["name"], imageurl: result[0]["imageurl"])
    user.username
  end

  def peep_name(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [id])
    user = User.new(id: result[0]["id"], username: result[0]["username"], email: result[0]["email"], name: result[0]["name"], imageurl: result[0]["imageurl"])
    user.name
  end

  def format_time(time)
    diff = ((DateTime.now - DateTime.parse(time)) * 24 * 60 * 60).to_i
    RelativeTime.in_words(Time.now - diff)
  end

  def image_picker(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [id])
    user = User.new(id: result[0]["id"], username: result[0]["username"], email: result[0]["email"], name: result[0]["name"], imageurl: result[0]["imageurl"])
    if user.imageurl != nil
      user.imageurl
    else
      "/images/avatar.png"
    end
  end
end
