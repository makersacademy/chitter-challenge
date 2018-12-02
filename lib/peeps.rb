require 'pg'
require 'time'
require './lib/users.rb'
require './lib/tags.rb'

class Peeps

  attr_reader :id, :user_id, :message, :time, :user,  :replying_to_id

  def initialize(id, user_id, message, time, replying_to_id, user=Users.user_with_id(user_id))
    @id = id.to_i
    @user_id = user_id.to_i
    @message = message
    @time = time
    @user = user
    @replying_to_id = replying_to_id
  end

  def self.all
    peeps = sql('
      SELECT p.id, user_id, message, time, name, username
      FROM peeps p
      left join users u
      on u.id = user_id
      order by time desc;
    ')
    peeps.map { |peep| Peeps.new(
      peep['id'],
      peep['user_id'],
      peep['message'],
      Time.parse(peep['time']),
      peep['name'],
      peep['username']
    )}
  end


  def self.create(user_id, peep_content, replying_to="NULL")
    query_result = sql("insert into peeps(user_id, message, replying_to_id)
          values (#{user_id}, '#{peep_content}', #{replying_to})
          RETURNING id, user_id, message, time, replying_to_id;")
          peep_data = query_result[0]
          new_peep = Peeps.new(peep_data["id"],
                    peep_data["user_id"],
                    peep_data["message"],
                    peep_data["time"],
                    peep_data["replying_to_id"]
                    )
          new_peep.update_tags
          new_peep
  end

  def update_tags
    tags = self.message.scan(/@\w+/)
    tags.each do |tag|
      tag_stripped = tag[1..tag.size]
      user = Users.user_with_name(tag_stripped)
      if user
        @message = @message.gsub(tag,"<a href=''/peeps/#{user.id}''>#{tag}</a>")
        #@message = @message.gsub(tag,"<a href='/peeps/#{user.id}'>#{tag}</a>")
        Tags.create(@id, @user_id)
      end
    end
    update
    #for each one of these, check if it is a user, if it is a user insert hyperlink into
    #content and insert a record into the table.
  end

  def update
    Peeps.sql("UPDATE peeps SET user_id = #{self.user_id}, message='#{self.message}'
                WHERE id=#{self.id}")
  end


  def self.is_a_user?(username)
    Users.user_with_name(username)
  end


  private

  def self.sql(query)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    return connection.exec(query)
  end


end
