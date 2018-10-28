require_relative 'database_connection'
# require Date

class Peep

  def self.all

    sql = %{select id, peep, parent_peep, posted_datetime, user_id
      from peeps order by id desc}
    peeps = DatabaseConnection.query(sql)
    # p "test here"
    # p peeps[0]["parent_peep"]
    peeps.map { |record| { id: record["id"],
      peep: record["peep"],
      posted_date: Peep.date_only(record["posted_datetime"]),
      peeper: find_username(record["user_id"]),
      parent_peep: record["parent_peep"] }
    }
  end

  def self.create(message, user_id, parent_peep = 0)
    # p message
    # p user_id
    # p parent_peep
    sql = %{INSERT INTO peeps
      (peep, user_id, parent_peep) VALUES
      ('#{message}', '#{user_id}', '#{parent_peep}')
      RETURNING id, peep, parent_peep, posted_datetime;}
      # p sql
    newpeep = DatabaseConnection.query(sql)
    # p newpeep[0]
    id = newpeep[0]["id"]

    Peep.new(id, message, user_id, parent_peep)
  end

  def self.reply(message, user_id, parent_peep)
    # p parent_peep
    create(message, user_id, parent_peep)

  end

  def self.date_only(date)
    date = DateTime.parse(date.to_s)
    date.strftime("%d/%m/%Y %H:%M:%S")
  end

  def self.find_username(user_id)
    User.find(user_id).username
  end

  def self.find(id)

    return nil unless id
    sql = %{select * from peeps where id = '#{id}'}
    record = DatabaseConnection.query(sql)
    Peep.new(record[0]['id'],
      record[0]['peep'],
      record[0]['user_id'],
      record[0]['parent_peep'])
  end

  attr_reader :id, :tags, :valid_tags, :valid_tags_usernames
  attr_reader :invalid_tags, :message, :user_id, :parent_peep

  def initialize(id, message, user_id, parent_peep = 0)
    @id = id
    @message = message
    @user_id = user_id
    @parent_peep = parent_peep
    # p "parent in initialize#{@parent_peep}"
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

  def invalid_tags?
    users = User.all_usernames
    # usernames = []
    # users_arr = users.map { |record| record["username"] }
    @tags.reject { |tag| users.include? tag }
    # p @tags.reject { |tag| users_arr.include? tag}

  end

end
