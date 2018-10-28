require_relative 'user'

class Peep
  attr_reader :id, :text, :user_id, :time
  def initialize(id:, text:, user_id:, time:)
    @id = id
    @text = text
    @user_id = user_id
    @time = time
  end

  def username
    User.find(column: 'id', value: @user_id).username
  end

  def self.create(text:, user_id:)
    time = Peep.timestamp
    text = Peep.tagging(text: text)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (text, user_id, time) "\
      "VALUES('#{text}', '#{user_id}', '#{time}') "\
      "RETURNING id, text, user_id, time;").first
    Peep.new(
      id: result['id'], text: result['text'], 
      user_id: result['user_id'], time: result['time']
    )
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps")
    all = peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'], 
        user_id: peep['user_id'],
        time: peep['time']
      )
    end
    all.sort_by { |peep| Time.parse(peep.time) }.reverse
  end

  def self.timestamp
    Time.new.strftime("%y-%m-%d %H:%M")
  end

  def self.where(user_id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id = '#{user_id}'")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'], 
        user_id: peep['user_id'],
        time: peep['time']
      )
    end
  end

  private_class_method

  def self.tagging(text:)
    tags = []
    tag_links = {}
    text.scan(/(@\w+)/) { |match| tags << match.first }
    tags.uniq.each do |tag|
      Peep.create_link_for_tag(tag, tag_links)
    end
    text.gsub(/(@\w+)/, tag_links)
  end

  def self.create_link_for_tag(tag, tag_links)
    user = User.find(column: 'username', value: tag[1..-1])
    if user.nil?
      tag_links[tag] = tag
    else
      tag_links[tag] = "<a href=\"/users/#{user.username}/peeps\">#{tag}</a>"
    end
  end

end
