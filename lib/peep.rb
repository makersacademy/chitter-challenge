# require 'net/smtp'
require 'pg'

class Peep
  def self.all
    results = sql_query("SELECT users.username, users.name, peeps.content, peeps.created FROM peeps INNER JOIN users ON peeps.user_id=users.user_id ORDER BY peeps.created DESC;")
    results.map { |result| Peep.new(result['username'], result['name'], result['content'], result['created']) }
  end

  attr_reader :username, :name, :content, :created

  def initialize(username, name, content, created)
    @username = username
    @name = name
    @content = content
    @created = created
  end

  def self.post_peep(user_id, content)
    sql_query("INSERT INTO peeps (user_id, content) VALUES(#{user_id}, '#{content.gsub("'", "''")}');")
  end

#   def self.send_email(to, peeper)
#     msg = <<END_OF_MESSAGE
#     From: alittlecross <alittlecross@live.co.uk>
#     To: <#{to}>
#     Subject: You were mentioned in a peep...
#     #{peeper} mentioned you in a peep
# END_OF_MESSAGE
#     Net::SMTP.start('localhost') { |smtp| smtp.send_message msg, 'alittlecross@live.co.uk', to }
#   end

  def since
    the_present = Time.now
    the_past = Time.parse(created)
    time_elapsed = the_present - the_past
    seconds = time_elapsed.round
    if seconds < 1
      "just now"
    elsif seconds < 2
      "#{seconds} second ago"
    elsif seconds < 60
      "#{seconds} seconds ago"
    elsif seconds < 120
      "#{(seconds/60).round} minute ago"
    elsif seconds < 3600
      "#{(seconds/60).round} minutes ago"
    elsif seconds < 7200
      "#{((seconds/60)/60).round} hour ago"
    elsif seconds < 86400
      "#{((seconds/60)/60).round} hours ago"
    elsif seconds < 172800
      "#{(((seconds/60)/60)/24).round} day ago"
    else
      "#{(((seconds/60)/60)/24).round} days ago"
    end
  end

  private

  def self.sql_query(query)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    return connection.exec(query)
  end
end
