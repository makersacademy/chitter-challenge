require 'date'

class Message

  # Instance Methods
  # ==============================

  attr_reader :id, :text, :user_id, :displayname, :username, :time_added, :comments, :related_id

  def initialize(id:, text:, user_id:, displayname:, username:, time_added:, comments:, related_id:)
    @id = id
    @text = text
    @user_id = user_id
    @username = username
    @displayname = displayname
    @time_added = time_added
    @comments = comments
    @related_id = related_id
  end

  # Class Methods
  # ==============================

  def self.setup(dbconnection:, emailclient:, tagclass:)
    @database = dbconnection
    @emailclient = emailclient
    @tag = tagclass
  end

  def self.all
    # collect messages
    messages = @database.command('SELECT message_id, text, user_id_fkey, date_added, username, display_name FROM messages JOIN users ON (users.user_id=messages.user_id_fkey) WHERE related_id IS NULL ORDER BY date_added DESC;')

    messages.map{|m_row|

      # collect all related messages as comments
      comments = []
      message_id = m_row['message_id']
      loop do
        comment = @database.command("SELECT message_id, text, user_id_fkey, related_id, date_added, username, display_name FROM messages JOIN users ON (users.user_id=messages.user_id_fkey) WHERE related_id = #{message_id};")

        break if comment.num_tuples.zero?

        comments.append(comment[0])
        message_id = comment[0]['message_id']
      end

      # map comments to message objects for display
      comments = comments.map{|c_row| self.new(id: c_row['message_id'], text: c_row['text'], user_id: c_row['user_id_fkey'], related_id: c_row['related_id'], displayname: c_row['display_name'], username: c_row['username'], time_added: DateTime.parse(c_row['date_added']), comments: nil)}

      # Create message object with related comments
      self.new(id: m_row['message_id'], text: m_row['text'], user_id: m_row['user_id_fkey'], related_id: nil, displayname: m_row['display_name'], username: m_row['username'], time_added: DateTime.parse(m_row['date_added']), comments: comments)
    }
  end

  def self.add_message(message:, user_id:, related_id: nil)
    if related_id
      @database.command("INSERT INTO messages(text, user_id_fkey, related_id) VALUES ('#{message}', '#{user_id}', '#{related_id}')")
    else
      @database.command("INSERT INTO messages(text, user_id_fkey) VALUES ('#{message}', '#{user_id}')")
    end
  end
end
