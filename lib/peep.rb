require_relative 'user'
require_relative 'mailer'

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

  def time_display
    Time.parse(time).strftime("%y-%m-%d %H:%M")
  end

  def self.create(text:, user_id:)
    time = 'now'
    text = Peep.tagging(text: text, user_id: user_id)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (text, user_id, date) "\
      "VALUES('#{text}', '#{user_id}', '#{time}') "\
      "RETURNING id, text, user_id, date;").first
    Peep.new(
      id: result['id'], text: result['text'], 
      user_id: result['user_id'], time: result['date']
    )
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps")
    all = peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'], 
        user_id: peep['user_id'],
        time: peep['date']
      )
    end
    all.sort_by { |peep| Time.parse(peep.time) }.reverse
  end

  def self.where(user_id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id ="\
      " '#{user_id}'")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'], 
        user_id: peep['user_id'],
        time: peep['date']
      )
    end
  end

  private_class_method

  def self.tagging(text:, user_id:)
    tags = []
    tag_links = {}
    text.scan(/(@\w+)/) { |match| tags << match.first }
    tags.uniq.each do |tag|
      Peep.process_tag(tag, tag_links, user_id)
    end
    text.gsub(/(@\w+)/, tag_links)
  end

  def self.process_tag(tag, tag_links, user_id)
    tagged_user = User.find(column: 'username', value: tag[1..-1])
    if tagged_user.nil?
      tag_links[tag] = tag
    else
      tag_links[tag] = Peep.create_tag(tag)
      Peep.send_tag_email(tagged_user, user_id)
    end
  end

  def self.create_tag(tag)
    "<a href=\"/users/#{tag[1..-1]}/peeps\">#{tag}</a>"
  end

  def self.send_tag_email(tagged_user, user_id)
    user = User.find(column: 'id', value: user_id)
    email = tagged_user.email
    message = "<a href=\"http://localhost:9292/users/#{user.username}/peeps\">"\
      "#{user.username}</a> tagged you."
    subject = 'You got tagged @ chitter'
    Mailer.send(email: email, subject: subject, message: message)
  end
end
