require 'pg'

class Posts
  attr_reader :id, :peep_text, :user_name, :created_at

  def initialize(id:, peep_text:, user_name:, created_at:)
    time = Time.now
    @id = id
    @peep_text = peep_text
    @user_name = user_name
    @created_at = time
  end

  def self.show_posts
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |post|
      p Posts.new(id: post['id'], peep_text: post['peep_text'], user_name: post['user_name'], created_at: post['created_at'])
    end
    # { |post| post['peep_text'] + " by " + post['user_name']
  end

  def self.create(peep_text:, user_name:, created_at:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    posts = connection.exec("INSERT INTO peeps(peep_text, user_name, created_at) VALUES('#{peep_text}', '#{user_name}', '#{created_at}')")
    posts.map do |post|
      Posts.new(id: post['id:'], peep_text: post['peep_text'], user_name: post['user_name'], created_at: post['created_at'])
    end
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end
end
