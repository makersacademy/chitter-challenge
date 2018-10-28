require_relative 'database_connection'
# require Date

class Peep

  def self.all

    sql = %{select id, peep, posted_datetime, user_id
      from peeps order by id desc}
    peeps = DatabaseConnection.query(sql)
    peeps.map { |record| { id: record["id"],
      peep: record["peep"],
      posted_date: Peep.date_only(record["posted_datetime"]),
      peeper: find_username(record["user_id"]) }
    }
  end

  def self.create(message, user_id)
    sql = %{INSERT INTO peeps
      (peep, user_id) VALUES
      ('#{message}', '#{user_id}') RETURNING id, peep, posted_datetime;}
      # p sql
    DatabaseConnection.query(sql)

    Peep.new(message, user_id)
  end

  def self.date_only(date)
    date = DateTime.parse(date.to_s)
    date.strftime("%d/%m/%Y %H:%M:%S")
  end

  def self.find_username(user_id)
    User.find(user_id).username
  end

  attr_reader :tags, :valid_tags, :valid_tags_usernames, :invalid_tags, :message, :user_id
  def initialize(message, user_id)
    @message = message
    @user_id = user_id
    @tags = any_tags?
    @valid_tags = valid_tags?
    @invalid_tags = invalid_tags?
  end

  def any_tags?
    # p tags = @message.scan(/@([\da-z\-]+)/)
    @message.scan(/@([\da-z\-]+)/).map { |m| m[0] }
    # p @message.scan(/@([\da-z\-]+)/)
  end

  def valid_tags?
    users = User.all_usernames
# p User.all_usernames
    # users_arr = users.map { |record| record["username"] }
    @tags.select { |tag| users.include? tag }
    # p @tags.reject { |tag| users_arr.include? tag}
  end

#   def valid_tags_id?
#     users = User.all_usernames
# # p User.all_usernames
#     # users_arr = users.map { |record| record["username"] }
#     valid = @tags.select { |tag| users.include? tag}
#     p "fdsfsd"
#     p valid.map { |val| User.find_user_id(val)}
#     # User.find_user_id(valid[0])
#     # p @tags.reject { |tag| users_arr.include? tag}
#   end

  def invalid_tags?
    users = User.all_usernames
    # usernames = []
    # users_arr = users.map { |record| record["username"] }
    @tags.reject { |tag| users.include? tag }
    # p @tags.reject { |tag| users_arr.include? tag}

  end

end
