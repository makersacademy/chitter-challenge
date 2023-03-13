require_relative "./peep"

module Record
  def self.to_user(record)
    user = User.new
    user.id = record["id"]
    user.fullname = record["fullname"]
    user.username = record["username"]
    user.email = record["email"]
    user.password = record["password"]
    return user
  end

  def self.to_peep(record)
    peep = Peep.new
    peep.id = record["id"].to_i
    peep.time = record["time"]
    peep.content = record["content"]
    peep.user_id = record["user_id"].to_i
    return peep
  end
end
