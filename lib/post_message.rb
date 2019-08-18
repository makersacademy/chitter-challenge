# frozen_string_literal: true

require 'pg'

class PostMessage
  attr_reader :id, :post, :date, :time, :username

  def initialize(id:, post:, date:, time:, username:)
    @id = id
    @post = post
    @date = date
    @time = time
    @username = username
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    result = connection.exec('SELECT * FROM posts;')
    result.map do |peep|
      PostMessage.new(id: peep['id'], post: peep['message'],time: peep['time'], date: peep['date'], username: peep['username'])
    end
  end

  def self.post(message, username)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    connection.exec("INSERT INTO posts (message,time,date,username) VALUES ('#{message}','#{Time.now.strftime("%H:%M")}','#{Time.now.strftime("%-d %b %Y")}','#{username}');")
  end
end
#
# test = PostMessage.all
# p test
